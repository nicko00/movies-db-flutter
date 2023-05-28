import 'package:flutter/material.dart';

import 'home_view_controller.dart';

class HomeViewModel extends HomeProtocol {
  late AnimationController _animationController;
  int _currentIndex = 0;

  @override
  int get currentIndex => _currentIndex;

  @override
  void didTapSelectedIndex(int index) {
    if (index != currentIndex) {
      
      onTapSelectedIndex?.call();
    }
    _currentIndex = index;
    notifyListeners();
  }

  @override
  AnimationController get animationController => _animationController;

  @override
  set animationController(AnimationController controller) => _animationController = controller;
}
