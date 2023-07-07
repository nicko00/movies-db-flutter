import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultBackButton extends StatelessWidget {
  final VoidCallback? onTapBack;

  const DefaultBackButton({super.key, this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTapBack ?? Navigator.of(context).pop,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.white30),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
