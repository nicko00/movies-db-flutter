import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultScreen extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool hasTopSafeArea;
  final bool isBottomBarTransparent;

  const DefaultScreen({
    super.key,
    this.hasTopSafeArea = true,
    this.isBottomBarTransparent = false,
    this.padding = const EdgeInsets.all(8),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkGray),
      child: Scaffold(
        extendBody: isBottomBarTransparent,
        body: SafeArea(
          top: hasTopSafeArea,
          bottom: !isBottomBarTransparent,
          child: child,
        ),
      ),
    );
  }
}
