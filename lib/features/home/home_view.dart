import 'dart:ui';

import 'package:flutter/material.dart';

import '../../localization/localize.dart';
import '../../support/style/app_colors.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  int get currentIndex;
  AnimationController get animationController;

  void didTapSelectedIndex(int index);
}

class HomeView extends StatelessWidget {
  final List<Widget> indexedChildren;
  final HomeViewModelProtocol viewModel;

  const HomeView({
    super.key,
    required this.viewModel,
    required this.indexedChildren,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedBuilder(
      animation: viewModel,
      builder: (_, __) {
        return Scaffold(
          extendBody: true,
          body: FadeTransition(
            opacity: viewModel.animationController,
            child: IndexedStack(
              index: viewModel.currentIndex,
              children: indexedChildren,
            ),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.white30, width: 0.4)),
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: BottomNavigationBar(
                  backgroundColor: AppColors.transparent,
                  currentIndex: viewModel.currentIndex,
                  onTap: viewModel.didTapSelectedIndex,
                  items: [
                    _bottomNavigationItem(
                      label: l10n.bottomNavigationHomeLabel,
                      icon: Icons.home_rounded,
                    ),
                    _bottomNavigationItem(
                      label: l10n.bottomNavigationSearchLabel,
                      icon: Icons.search_rounded,
                    ),
                    _bottomNavigationItem(
                      label: l10n.bottomNavigationFavoritesLabel,
                      icon: Icons.more_horiz_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationItem({required String label, required IconData icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
        color: AppColors.white30,
        size: 20,
      ),
      activeIcon: Icon(
        icon,
        color: AppColors.white,
        size: 24,
      ),
    );
  }
}
