import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultScreen extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const DefaultScreen({
    super.key,
    this.padding = const EdgeInsets.all(8),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.darkGray),
      child: Scaffold(
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
