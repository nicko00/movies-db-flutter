import 'package:flutter/material.dart';

import '../style/app_colors.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  DefaultIconButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
