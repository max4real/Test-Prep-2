import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Shimmer.fromColors(
            baseColor: theme.shimmerBaseColor,
            highlightColor: theme.shimmerHighlightColor,
            child: Container(color: theme.overlayBg),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withAlpha(0.1.toAlpha),
                  Colors.transparent,
                  Colors.black.withAlpha(0.3.toAlpha),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 0.4, 1.0],
              ),
            ),
          ),

          Positioned(
            top: 8,
            right: 8,
            child: Shimmer.fromColors(
              baseColor: theme.shimmerBaseColor,
              highlightColor: theme.shimmerHighlightColor,
              child: Container(
                width: 38,
                height: 20,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: theme.shimmerBaseColor,
                  highlightColor: theme.shimmerHighlightColor,
                  child: Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.overlayBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                6.heightBox,
                Shimmer.fromColors(
                  baseColor: theme.shimmerBaseColor,
                  highlightColor: theme.shimmerHighlightColor,
                  child: Container(
                    height: 12,
                    width: 60,
                    decoration: BoxDecoration(
                      color: theme.overlayBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
