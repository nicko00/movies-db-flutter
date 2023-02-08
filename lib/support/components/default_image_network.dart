import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import 'placeholders/loading_view.dart';

class DefaultImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double scale;

  const DefaultImageNetwork({
    super.key,
    this.height,
    this.width,
    required this.scale,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.all(scale),
        child: Image.network(
          imageUrl,
          errorBuilder: (_, __, ___) {
            return Center(
              child: Icon(
                Icons.error_outline,
                color: AppColors.darkGray,
              ),
            );
          },
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) return child;
      
            return const LoadingView();
          },
        ),
      ),
    );
  }
}
