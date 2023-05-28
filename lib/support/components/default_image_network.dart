import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import 'placeholders/shimmer_loading_placeholder.dart';

class DefaultImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double scale;

  const DefaultImageNetwork({
    super.key,
    this.height,
    this.width,
    this.scale = 0,
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
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, child, ___) {
            return LayoutBuilder(builder: (_, constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                decoration: BoxDecoration(color: AppColors.gray30),
              );
            });
          },
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return LayoutBuilder(
              builder: (_, constraints) {
                return ShimmerLoadingPlaceholder(
                  baseColor: AppColors.gray,
                  highlightColor: AppColors.gray30,
                  child: Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
