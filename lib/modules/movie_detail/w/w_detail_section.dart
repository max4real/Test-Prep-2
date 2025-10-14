import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/modules/movie_detail/c/c_movie_detail.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_movie_detail.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_cast_card.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_cast_card_shimmer.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_info_item.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_production_list.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class DetailSection extends StatelessWidget {
  final MovieDetailModel detail;
  const DetailSection({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    final MovieDetailController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (detail.tagline != null && detail.tagline!.isNotEmpty) ...[
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
          Divider(color: theme.overlayBg),
        ],
        Text(
          'Overview',
          style: TextStyle(
            color: theme.textMain,
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w800,
          ),
        ),
        8.heightBox,
        ReadMoreText(
          detail.overview,
          trimMode: TrimMode.Line,
          trimLines: 3,
          colorClickableText: AppColor.secondColor,
          trimCollapsedText: ' Show more',
          trimExpandedText: ' Show less',
          style: TextStyle(
            color: theme.textMain,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: theme.textSecond,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: theme.textSecond,
          ),
        ),
        Divider(color: theme.overlayBg),
        Text(
          'Casts',
          style: TextStyle(
            color: theme.textMain,
            fontSize: 14,
            height: 1.5,
            fontWeight: FontWeight.w800,
          ),
        ),
        8.heightBox,
        Obx(() {
          if (controller.xcastLoading.value) {
            return SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                separatorBuilder: (_, __) => 10.widthBox,
                itemBuilder: (_, __) => const CastCardShimmer(),
              ),
            );
          }

          if (controller.castList.isEmpty) {
            return Center(
              child: Text(
                "Failed to load cast",
                style: TextStyle(color: theme.textSecond),
              ),
            );
          }

          return SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.castList.length,
              separatorBuilder: (_, __) => 10.widthBox,
              itemBuilder: (context, index) {
                return CastCard(castModel: controller.castList[index]);
              },
            ),
          );
        }),
        Divider(color: theme.overlayBg),
        if (detail.genres.isNotEmpty) ...[
          Text(
            'Genres',
            style: TextStyle(
              color: theme.textMain,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w800,
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  detail.genres.map((g) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Chip(
                        label: Text(
                          g.name,
                          style: TextStyle(color: theme.textMain, fontSize: 12),
                        ),
                        backgroundColor: theme.overlayBg,
                      ),
                    );
                  }).toList(),
            ),
          ),
          Divider(color: theme.overlayBg),
        ],
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InfoItemWidget(label: "Runtime", value: "${detail.runtime} min"),
            InfoItemWidget(label: "Budget", value: "\$${detail.budget}"),
            InfoItemWidget(label: "Revenue", value: "\$${detail.revenue}"),
          ],
        ),
        10.heightBox,
        Divider(color: theme.overlayBg),

        if (detail.productionCompanies.isNotEmpty) ...[
          Text(
            'Production Companies',
            style: TextStyle(
              color: theme.textMain,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w800,
            ),
          ),
          8.heightBox,
          ProductionListWidget(list: detail.productionCompanies),
          8.heightBox,
          Divider(color: theme.overlayBg),
        ],
        10.heightBox,
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
        10.heightBox,
      ],
    );
  }
}
