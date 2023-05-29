import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class LoadingView extends StatelessWidget {
  final Color? color;

  const LoadingView({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppColors.white,
      ),
    );
  }
}
