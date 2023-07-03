import 'dart:ui';

import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';
import 'default_elevated_button.dart';

class DefaultBottomSheet extends StatelessWidget {
  final String title;
  final String? description;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final VoidCallback? onTapPrimaryButton;
  final VoidCallback? onTapSecondaryButton;

  const DefaultBottomSheet({
    super.key,
    required this.title,
    this.description,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.onTapPrimaryButton,
    this.onTapSecondaryButton,
  });

  List<Widget> get _description {
    final bottomSheetDescription = description;

    if (bottomSheetDescription != null) {
      return [
        Flexible(
          child: Text(
            bottomSheetDescription,
            textAlign: TextAlign.center,
            style: AppFonts.montserratMedium(13, color: AppColors.gray),
          ),
        ),
        const SizedBox(height: 20),
      ];
    }

    return [const SizedBox.shrink()];
  }

  Widget get _buttons {
    final primaryText = primaryButtonText;
    final secondaryText = secondaryButtonText;

    if (primaryText != null && secondaryText != null) {
      return Row(
        children: [
          Expanded(
            child: DefaultElevatedButton(
              title: secondaryText,
              isPrimary: false,
              onTap: onTapSecondaryButton,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: DefaultElevatedButton(
              title: primaryText,
              onTap: onTapPrimaryButton,
            ),
          ),
        ],
      );
    }

    if (primaryText != null) {
      return DefaultElevatedButton(
        title: primaryText,
        onTap: onTapPrimaryButton,
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
          color: AppColors.lighterBlack,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppFonts.montserratBold(16, color: AppColors.white),
                ),
              ),
              const SizedBox(height: 16),
              ..._description,
              const SizedBox(height: 16),
              _buttons,
            ],
          ),
        ),
      ),
    );
  }
}
