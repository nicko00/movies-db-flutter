import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_fonts.dart';
import 'default_back_button.dart';

class DefaultAppBar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final VoidCallback? onTapBack;

  const DefaultAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.onTapBack,
  });

  Widget get _leading => leading ?? DefaultBackButton(onTapBack: onTapBack);

  Widget get _title {
    final appBarTitle = title;

    if (appBarTitle != null) {
      Text(
        appBarTitle,
        style: AppFonts.montserratBold(16, color: AppColors.white),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(92),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _leading,
          _title,
          ...?actions,
        ],
      ),
    );
  }
}
