import 'package:flutter/material.dart';

import '../../support/components/default_screen.dart';
import '../../support/style/app_assets.dart';
import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';

abstract class SplashViewModelProtocol with ChangeNotifier {
  List<String> get appName;

  AnimationController get translateAnimationController;
  AnimationController get fadeInAnimationController;
  AnimationController get rotateAnimationController;
}

class SplashView extends StatelessWidget {
  final SplashViewModelProtocol viewModel;

  const SplashView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      isBottomBarTransparent: true,
      hasTopSafeArea: false,
      child: AnimatedBuilder(
        animation: viewModel.translateAnimationController,
        builder: (_, __) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(viewModel.rotateAnimationController),
                  child: Image.asset(
                    AppAssets.icApp,
                    width: 84,
                    height: 84,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _textSpans,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> get _textSpans {
    final textSpans = <Widget>[];

    viewModel.appName.asMap().forEach((index, char) {
      textSpans.add(
        FadeTransition(
          opacity: viewModel.fadeInAnimationController,
          child: Transform.translate(
            offset: Offset(0, (viewModel.translateAnimationController.value * index) + 0.5),
            child: Text(
              char,
              style: AppFonts.montserratBold(32, color: AppColors.green),
            ),
          ),
        ),
      );
    });

    return textSpans;
  }
}
