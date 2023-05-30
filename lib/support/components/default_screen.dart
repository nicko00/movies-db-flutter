import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultScreen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry padding;
  final bool hasTopSafeArea;
  final bool isBottomBarTransparent;

  const DefaultScreen({
    super.key,
    this.appBar,
    this.hasTopSafeArea = true,
    this.backgroundColor,
    this.isBottomBarTransparent = false,
    this.padding = const EdgeInsets.all(8),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkGray),
      child: Scaffold(
        backgroundColor: backgroundColor ?? AppColors.darkGray,
        appBar: appBar,
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
