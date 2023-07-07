import 'dart:async';

import 'package:flutter/material.dart';

import '../../support/components/create_user_bottom_sheet/create_user_bottom_sheet.dart';
import '../../support/extensions/dialog_extensions.dart';
import '../home/home_factory.dart';
import 'splash_view.dart';

abstract class SplashProtocol extends SplashViewModelProtocol {
  set translateAnimationController(AnimationController controller);
  set fadeInAnimationController(AnimationController controller);
  set rotateAnimationController(AnimationController controller);

  void verifySession();

  VoidCallback? onHasSession;
  void Function(CreateUserBottomSheetViewModelProtocol viewModel)? onHasNotSession;
}

class SplashViewController extends StatefulWidget {
  final SplashProtocol viewModel;

  const SplashViewController({super.key, required this.viewModel});

  @override
  State<SplashViewController> createState() => _SplashViewControllerState();
}

class _SplashViewControllerState extends State<SplashViewController> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _bind();
    widget.viewModel.verifySession();
    _setupSplashAnimation();
  }

  @override
  void dispose() {
    widget.viewModel.fadeInAnimationController.dispose();
    widget.viewModel.translateAnimationController.dispose();
    widget.viewModel.rotateAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SplashView(viewModel: widget.viewModel);
  }

  void _bind() {
    widget.viewModel.onHasSession = () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeFactory.route,
        (_) => false,
      );
    };

    widget.viewModel.onHasNotSession = (CreateUserBottomSheetViewModelProtocol viewModel) {
      showCreateUserBottomSheet(viewModel: viewModel);
    };
  }

  void _setupSplashAnimation() {
    widget.viewModel.translateAnimationController = AnimationController(
      vsync: this,
      upperBound: 12,
      reverseDuration: const Duration(milliseconds: 1500),
    );
    widget.viewModel.fadeInAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    widget.viewModel.rotateAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 20000),
    );

    Timer(const Duration(milliseconds: 2000), () {
      widget.viewModel.translateAnimationController.reverse(from: 12);
      widget.viewModel.fadeInAnimationController.forward();
      widget.viewModel.rotateAnimationController.forward();
    });
  }
}
