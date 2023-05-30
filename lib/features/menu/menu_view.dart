import 'package:flutter/material.dart';

import '../../support/components/default_app_bar.dart';
import '../../support/components/default_screen.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class MenuViewModelProtocol with ChangeNotifier {}

class MenuView extends StatelessWidget {
  final MenuViewModelProtocol viewModel;

  const MenuView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      backgroundColor: AppColors.darkerGray,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(32),
        child: DefaultAppBar(),
      ),
      child: Column(
        children: [
          Flexible(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _menuItemWidget(
                  title: 'Perfil',
                  icon: Icons.person,
                  onTap: () {},
                ),
                _menuItemWidget(
                  title: 'Configurações',
                  icon: Icons.settings_rounded,
                  onTap: () {},
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
        child: ListTile(
          onTap: onTap,
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
    );
  }
}
