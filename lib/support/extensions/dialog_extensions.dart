import 'package:flutter/material.dart';

import '../components/create_user_bottom_sheet/create_user_bottom_sheet.dart';
import '../style/app_colors.dart';

extension DialogExtensions on State {
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
}
