import 'package:flutter/material.dart';

import '../components/create_user_bottom_sheet/create_user_bottom_sheet.dart';
import '../components/default_bottom_sheet.dart';
import '../style/app_colors.dart';
import '../style/app_fonts.dart';

extension DialogExtensions on State {
  void showDefaultBottomSheet({
    required String title,
    String? description,
    String? primaryButtonText,
    String? secondaryButtonText,
    VoidCallback? onTapPrimaryButton,
    VoidCallback? onTapSecondaryButton,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.transparent,
      barrierColor: AppColors.transparent,
      builder: (_) {
        return DefaultBottomSheet(
          title: title,
          description: description,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onTapPrimaryButton: onTapPrimaryButton,
          onTapSecondaryButton: onTapSecondaryButton,
        );
      },
    );
  }

  void showCreateUserBottomSheet({
    required CreateUserBottomSheetViewModelProtocol viewModel,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      barrierColor: AppColors.transparent,
      backgroundColor: AppColors.transparent,
      context: context,
      builder: (_) {
        return CreateUserBottomSheet(viewModel: viewModel);
      },
    );
  }

  void showDefaultSnackBar({
    required String message,
    int duration = 3000,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: duration),
        content: Text(
          message,
          style: AppFonts.montserratRegular(
            14,
            color: AppColors.white,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
    );
  }
}
