import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultTextFormField extends StatelessWidget {
  final IconData? icon;
  final bool isEnabled;
  final bool isPrimary;
  final String? counter;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  final void Function(String)? onChanged;

  const DefaultTextFormField({
    super.key,
    this.icon,
    this.hintText,
    this.onChanged,
    this.errorText,
    this.controller,
    this.initialValue,
    this.counter = '',
    this.isEnabled = true,
    this.isPrimary = true,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: AppColors.darkerGray,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: TextFormField(
            enabled: isEnabled,
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            initialValue: initialValue,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              icon: _inputIcon,
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: EdgeInsets.symmetric(
                horizontal: icon != null ? 0 : 12,
                vertical: 24,
              ),
              hintStyle: AppFonts.montserratRegular(13, color: AppColors.gray30),
              errorStyle: AppFonts.playfairMedium(12, color: AppColors.red),
            ),
          ),
        ),
        Text(
          errorText ?? '',
          style: AppFonts.montserratRegular(13, color: AppColors.red),
        ),
      ],
    );
  }

  Widget? get _inputIcon {
    return icon == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Icon(icon, color: AppColors.gray30),
          );
  }
}
