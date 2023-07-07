import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultScreen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry padding;
  final bool hasTopSafeArea;
  final bool isBottomBarTransparent;
  final Gradient? scaffoldGradient;

  const DefaultScreen({
    super.key,
    this.appBar,
    this.hasTopSafeArea = true,
    this.backgroundColor,
    this.isBottomBarTransparent = false,
    this.padding = const EdgeInsets.all(8),
    this.scaffoldGradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkGray),
      child: SafeArea(
        top: hasTopSafeArea,
        bottom: !isBottomBarTransparent,
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: appBar,
          extendBody: isBottomBarTransparent,
          body: Container(
            decoration: BoxDecoration(
              gradient: scaffoldGradient,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
