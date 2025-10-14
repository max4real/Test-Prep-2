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
          // tagline
          Container(
            height: 14,
            width: 180,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          8.heightBox,
          Divider(color: theme.overlayBg),
          10.heightBox,

          // Overview title
          Container(
            height: 16,
            width: 100,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          8.heightBox,

          // Overview text block
          ...List.generate(
            4,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
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
          Divider(color: theme.overlayBg),
          10.heightBox,

          // Genres
          Container(
            height: 14,
            width: 80,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          8.heightBox,
          Wrap(
            spacing: 6,
            runSpacing: 8,
            children: List.generate(
              4,
              (index) => Container(
                height: 26,
                width: 60,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          10.heightBox,
          Divider(color: theme.overlayBg),
          10.heightBox,

          // Info row (runtime, budget, revenue)
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

          16.heightBox,
          Divider(color: theme.overlayBg),
          10.heightBox,

          // Production companies logos
          Container(
            height: 14,
            width: 150,
            decoration: BoxDecoration(
              color: theme.overlayBg,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          8.heightBox,
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              3,
              (index) => Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: theme.overlayBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  5.heightBox,
                  Container(
                    height: 10,
                    width: 50,
                    decoration: BoxDecoration(
                      color: theme.overlayBg,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),

          16.heightBox,
          Divider(color: theme.overlayBg),
          10.heightBox,

          // Rating row
          Row(
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  shape: BoxShape.circle,
                ),
              ),
              6.widthBox,
              Container(
                height: 14,
                width: 60,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              8.widthBox,
              Container(
                height: 12,
                width: 40,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
          10.heightBox,
        ],
      ),
    );
  }
}
