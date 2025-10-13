import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class DetailShimmer extends StatelessWidget {
  const DetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return Shimmer.fromColors(
      baseColor: theme.shimmerBaseColor,
      highlightColor: theme.shimmerHighlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14,
            width: 180,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          12.heightBox,

          Row(
            children: List.generate(
              3,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Container(
                  height: 22,
                  width: 60,
                  decoration: BoxDecoration(
                    color: theme.overlayBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
          20.heightBox,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) => Container(
                height: 20,
                width: 80,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          20.heightBox,

          ...List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 12,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),

          16.heightBox,
          Container(
            height: 16,
            width: 120,
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
