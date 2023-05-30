import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';
import 'placeholders/loading_view.dart';

class DefaultElevatedButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final bool isPrimary;
  final bool isDisabled;
  final VoidCallback? onTap;

  const DefaultElevatedButton({
    super.key,
    this.onTap,
    this.isDisabled = false,
    this.isPrimary = true,
    this.isLoading = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _buttonOnTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: _buttonColor,
        disabledBackgroundColor: _disabledButtonColor,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _buttonChild,
      ),
    );
  }

  Color get _disabledButtonColor => isPrimary ? AppColors.white : AppColors.green;

  Widget get _buttonChild {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: _loadingPlaceholder,
      );
    }

    return Text(
      title,
      style: AppFonts.montserratBold(13, color: _fontColor),
    );
  }

  Color get _buttonColor => isPrimary ? AppColors.white : AppColors.green;

  VoidCallback? get _buttonOnTap {
    if (isLoading || isDisabled) return null;

    return onTap;
  }

  Widget get _loadingPlaceholder {
    if (isPrimary) {
      return LoadingView(color: AppColors.darkerGray);
    }

    return LoadingView(color: AppColors.white);
  }

  Color get _fontColor => isPrimary ? AppColors.darkerGray : AppColors.white;
}
