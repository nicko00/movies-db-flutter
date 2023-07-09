import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localize.dart';
import 'package:flutter_svg/svg.dart';

import '../../localization/localize.dart';
import '../../support/components/default_back_button.dart';
import '../../support/components/default_image_network.dart';
import '../../support/components/default_screen.dart';
import '../../support/components/placeholders/shimmer_loading_placeholder.dart';
import '../../support/style/app_assets.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import 'item/favorite_movie_item_view.dart';

abstract class ProfileViewModelProtocol with ChangeNotifier {
  bool get isFavoritesLoading;
  bool get isUserLoading;
  String get userName;
  String? get userPhotoUrl;
  List<FavoriteMovieItemViewModelProtocol> get itemViewModels;

  Future<void> didRefresh();
  void didTapEditPhoto();
}

class ProfileView extends StatelessWidget {
  final ProfileViewModelProtocol viewModel;

  const ProfileView({super.key, required this.viewModel});

  Widget get _imageWidget {
    final photoUrl = viewModel.userPhotoUrl;

    if (photoUrl == null) {
      return SvgPicture.asset(AppAssets.icProfile);
    }

    return DefaultImageNetwork(
      imageUrl: photoUrl,
      width: 74,
      height: 74,
      shape: BoxShape.circle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return DefaultScreen(
      scaffoldGradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.black50, AppColors.darkerGray],
        stops: const [0.5, 1],
      ),
      child: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return RefreshIndicator(
            color: AppColors.green,
            onRefresh: viewModel.didRefresh,
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  leadingWidth: 84,
                  toolbarHeight: 84,
                  expandedHeight: 250,
                  backgroundColor: AppColors.black50,
                  leading: const DefaultBackButton(),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 40),
                          _userImageWidget,
                          const SizedBox(height: 16),
                          _userNameWidget,
                        ],
                      ),
                    ),
                  ),
                ),
                _listMoviesWidget(l10n),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _listMoviesWidget(Localization l10n) {
    if (viewModel.isFavoritesLoading) {
      return SliverToBoxAdapter(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            color: AppColors.darkerGray,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.profileFavoritesLabel,
                  style: AppFonts.montserratBold(
                    24,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (_, __) {
                    return ShimmerLoadingPlaceholder(
                      baseColor: AppColors.darkGray,
                      highlightColor: AppColors.gray30,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.gray,
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (viewModel.itemViewModels.isEmpty) {
      return SliverFillRemaining(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            color: AppColors.darkerGray,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.profileFavoritesLabel,
                  style: AppFonts.montserratBold(
                    24,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Center(
                    child: Text(
                      l10n.profileFavoritesEmptyPlaceholderLabel,
                      textAlign: TextAlign.center,
                      style: AppFonts.montserratBold(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          color: AppColors.darkerGray,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.profileFavoritesLabel,
                style: AppFonts.montserratBold(
                  24,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.itemViewModels.length,
                itemBuilder: (_, index) {
                  final itemViewModel = viewModel.itemViewModels[index];
                  return FavoriteMovieItemView(itemViewModel: itemViewModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _userNameWidget {
    if (viewModel.isUserLoading) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ShimmerLoadingPlaceholder(
          baseColor: AppColors.gray,
          highlightColor: AppColors.gray30,
          child: Container(
            height: 20,
            color: AppColors.gray30,
          ),
        ),
      );
    }

    return Text(
      viewModel.userName,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppFonts.montserratMedium(24, color: AppColors.white),
    );
  }

  Widget get _userImageWidget {
    if (viewModel.isUserLoading) {
      return ShimmerLoadingPlaceholder(
        baseColor: AppColors.darkGray,
        highlightColor: AppColors.gray30,
        child: SvgPicture.asset(AppAssets.icProfile),
      );
    }

    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _imageWidget,
          InkWell(
            onTap: viewModel.didTapEditPhoto,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: AppColors.white,
              ),
              child: Icon(
                Icons.edit,
                color: AppColors.lightGreen70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
