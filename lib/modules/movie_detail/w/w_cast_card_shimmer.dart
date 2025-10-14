import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class CastCardShimmer extends StatelessWidget {
  const CastCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 140,
            width: 100,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          8.heightBox,

          // Actor name placeholder
          Container(
            height: 12,
            width: 80,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          6.heightBox,

          // Character name placeholder
          Container(
            height: 10,
            width: 60,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ],
      ),
    );
  }
}
