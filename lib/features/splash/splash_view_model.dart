import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/localize.dart';
import '../../support/components/create_user_bottom_sheet/create_user_bottom_sheet_view_model.dart';
import '../../support/utils/session_manager.dart';
import 'splash_view_controller.dart';

class SplashViewModel extends SplashProtocol {
  late AnimationController _translateController;
  late AnimationController _fadeInController;
  late AnimationController _rotateController;

  final Localization l10n;
  final SessionManagerProtocol sessionManager;

  SplashViewModel({required this.l10n, required this.sessionManager});

  @override
  AnimationController get translateAnimationController => _translateController;

  @override
  set translateAnimationController(AnimationController controller) => _translateController = controller;

  @override
  AnimationController get fadeInAnimationController => _fadeInController;

  @override
  set fadeInAnimationController(AnimationController controller) => _fadeInController = controller;

  @override
  AnimationController get rotateAnimationController => _rotateController;

  @override
  set rotateAnimationController(AnimationController controller) => _rotateController = controller;

  @override
  List<String> get appName => l10n.appTitle.characters.toList();

  @override
  void verifySession() {
    Timer(const Duration(milliseconds: 3500), () {
      sessionManager.verifySession().whenComplete(() {
        if (sessionManager.hasSession) {
          onHasSession?.call();
        } else {
          final viewModel = CreateUserBottomSheetViewModel(l10n: l10n, sessionManager: sessionManager,);

          onHasNotSession?.call(viewModel);
        }
      });
    });
  }
}
