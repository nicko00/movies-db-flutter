import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/components/default_app_bar.dart';
import '../../support/components/default_screen.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class MenuViewModelProtocol with ChangeNotifier {
  void didTapProfile();
  void didTapSettings();
}

class MenuView extends StatelessWidget {
  final MenuViewModelProtocol viewModel;

  const MenuView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return DefaultScreen(
      scaffoldGradient: RadialGradient(
        radius: 1.7,
        stops: const [
          0.9,
          1.0,
        ],
        center: Alignment.topLeft,
        colors: [
          AppColors.darkerGray,
          AppColors.lightGreen20,
        ],
      ),
      backgroundColor: AppColors.darkerGray,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(92),
        child: DefaultAppBar(),
      ),
      child: Column(
        children: [
          Flexible(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _menuItemWidget(
                  title: l10n.menuProfileInputTitle,
                  icon: Icons.person,
                  onTap: viewModel.didTapProfile,
                ),
                _menuItemWidget(
                  title: l10n.menuSettingsInputTitle,
                  icon: Icons.settings_rounded,
                  onTap: viewModel.didTapSettings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItemWidget({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      sliver: SliverToBoxAdapter(
        child: Material(
          color: AppColors.transparent,
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              leading: Icon(
                icon,
                color: AppColors.white,
                size: 24,
              ),
              title: Text(
                title,
                style: AppFonts.montserratBold(16, color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
