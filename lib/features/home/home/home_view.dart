import 'package:flutter/material.dart';

import '../../../localization/localize.dart';
import '../../../support/style/app_colors.dart';

abstract class HomeViewModelProtocol extends ChangeNotifier {
  int get currentIndex;
  void didTapSelectedIndex(int index);
}

class HomeView<ViewModel extends HomeViewModelProtocol> extends StatelessWidget {
  final ViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final l10n = Localize.instance.l10n;

    return AnimatedBuilder(
        animation: viewModel,
        builder: (_, __) {
          return Scaffold(
            body: Container(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: viewModel.didTapSelectedIndex,
              items: [
                _bottomNavigationItem(
                  l10n.bottomNavigationHomeLabel,
                  Icons.home_rounded,
                ),
                _bottomNavigationItem(
                  l10n.bottomNavigationSearchLabel,
                  Icons.search_rounded,
                ),
                _bottomNavigationItem(
                  l10n.bottomNavigationFavoritesLabel,
                  Icons.favorite_rounded,
                ),
              ],
            ),
          );
        });
  }

  BottomNavigationBarItem _bottomNavigationItem(String label, IconData icon) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
        color: AppColors.green50,
        size: 20,
      ),
      activeIcon: Icon(
        icon,
        color: AppColors.green,
        size: 24,
      ),
    );
  }
}
