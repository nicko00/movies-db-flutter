import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import 'placeholders/shimmer_loading_placeholder.dart';

class DefaultImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double scale;
  final double? borderRadius;
  final BoxFit imageFit;
  final BoxShape shape;

  const DefaultImageNetwork({
    super.key,
    this.height,
    this.width,
    this.scale = 0,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
    this.imageFit = BoxFit.cover,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius;

    return AnimatedContainer(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: radius == null ? null : BorderRadius.all(Radius.circular(radius)),
      ),
      duration: const Duration(milliseconds: 500),
      padding: EdgeInsets.all(scale),
      child: Image.network(
        imageUrl,
        fit: imageFit,
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
    );
  }
}
