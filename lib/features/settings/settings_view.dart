import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/components/default_screen.dart';
import '../../support/components/placeholders/shimmer_loading_placeholder.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class SettingsViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  bool get isMatureContentActive;

  void didTapToggleMatureContent(bool value);
}

class SettingsView extends StatelessWidget {
  final SettingsViewModelProtocol viewModel;

  const SettingsView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return DefaultScreen(
      child: AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                collapsedHeight: 60,
                expandedHeight: 120,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1.2,
                  title: Text(
                    l10n.settingsTitle,
                    style: AppFonts.montserratBold(32, color: AppColors.white),
                  ),
                ),
              ),
              _settingsItemWidget(
                value: viewModel.isMatureContentActive,
                onChange: viewModel.didTapToggleMatureContent,
                label: l10n.settingsMatureContentInputHelper,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _settingsItemWidget({
    required bool value,
    required void Function(bool value) onChange,
    required String label,
  }) {
    if (viewModel.isLoading) {
      return SliverPadding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        sliver: SliverToBoxAdapter(
          child: ShimmerLoadingPlaceholder(
            baseColor: AppColors.gray30,
            highlightColor: AppColors.darkGray,
            child: Container(height: 32, color: AppColors.darkGray),
          ),
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      sliver: SliverToBoxAdapter(
        child: SwitchListTile(
          value: value,
          onChanged: onChange,
          title: Text(
            label,
            style: AppFonts.montserratMedium(16, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
