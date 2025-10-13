import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_movie_detail.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_info_item.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class DetailSection extends StatelessWidget {
  final MovieDetailModel detail;
  const DetailSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (detail.tagline != null && detail.tagline!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '"${detail.tagline!}"',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: theme.textMain,
              ),
            ),
          ),

        if (detail.genres.isNotEmpty)
          Wrap(
            spacing: 6,
            children:
                detail.genres
                    .map(
                      (g) => Chip(
                        label: Text(g.name),
                        backgroundColor: AppColor.darkGreen,
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    )
                    .toList(),
          ),

        16.heightBox,

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoItemWidget(label: "Runtime", value: "${detail.runtime} min"),
            InfoItemWidget(label: "Budget", value: "\$${detail.budget}"),
            InfoItemWidget(label: "Revenue", value: "\$${detail.revenue}"),
          ],
        ),

        16.heightBox,

        Text(
          detail.overview,
          style: TextStyle(color: theme.textMain, fontSize: 14, height: 1.5),
        ),

        20.heightBox,

        Row(
          children: [
            Icon(
              TablerIcons.star_filled,
              color: AppColor.secondColor,
              size: 18,
            ),
            4.widthBox,
            Text(
              "${detail.voteAverage.toStringAsFixed(1)} / 10",
              style: TextStyle(
                color: theme.textMain,
                fontWeight: FontWeight.w700,
              ),
            ),
            8.widthBox,
            Text(
              "(${detail.voteCount} votes)",
              style: TextStyle(color: theme.textSecond, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
