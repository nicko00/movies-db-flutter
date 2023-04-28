import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';

class DefaultTextFormField extends StatelessWidget {
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

  OutlineInputBorder get _focusedInputBorder {
    return isPrimary ? _inputBorder(AppColors.white10) : _inputBorder(AppColors.darkerGray);
  }

  OutlineInputBorder get _enabledInputBorder {
    return isPrimary ? _inputBorder(AppColors.white60) : _inputBorder(AppColors.darkGray);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      initialValue: initialValue,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        hintStyle: _inputHintStyle(),
        enabledBorder: _enabledInputBorder,
        focusedBorder: _focusedInputBorder,
        disabledBorder: _inputBorder(AppColors.gray30),
        errorStyle: AppFonts.playfairMedium(12, color: AppColors.red),
      ),
    );
  }

  OutlineInputBorder _inputBorder(Color color) {
    return OutlineInputBorder(borderSide: BorderSide(color: color, width: 2));
  }

  TextStyle _inputHintStyle() {
    if (isPrimary) return AppFonts.montserratRegular(14, color: AppColors.gray30);

    return AppFonts.montserratRegular(14, color: AppColors.darkGray);
  }
}
