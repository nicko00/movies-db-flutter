import 'package:flutter/material.dart';

import '../../../support/style/app_colors.dart';

class RatingStarIndicator extends StatelessWidget {
  final double rating;

  const RatingStarIndicator({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Center(child: Row(children: _starList));
  }

  double get _formattedRating => (rating / 2);

  int get _realRating => _formattedRating.truncate();

  double get _partRating {
    final partRating = (_formattedRating - _formattedRating.truncate());

    return partRating > 0 ? partRating : 1;
  }

  List<Widget> get _starList {
    final stars = <Widget>[];

    for (var i = 1; i <= 5; i++) {
      if (i < _realRating) {
        stars.add(
          Icon(
            color: AppColors.green,
            Icons.star_rate_rounded,
          ),
        );
      } else if (i == _realRating) {
        stars.add(
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect rect) {
              return LinearGradient(
                stops: [0, _partRating, _partRating],
                colors: [AppColors.green, AppColors.green, AppColors.black],
              ).createShader(rect);
            },
            child: const Icon(Icons.star_rate_rounded),
          ),
        );
      } else {
        stars.add(
          Icon(
            Icons.star_rate_rounded,
            color: AppColors.black,
          ),
        );
      }
    }

    return stars;
  }
}
