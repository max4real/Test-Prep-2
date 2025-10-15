import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/w_custom_loading.dart';
import 'package:test_prep_2/core/widget/w_wiggle_button.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/modules/movie_detail/c/c_movie_detail.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_detail_section.dart';
import 'package:test_prep_2/modules/movie_detail/w/w_detail_shimmer.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieCardModel movie;
  final String heroKey;
  const MovieDetailPage({
    super.key,
    required this.movie,
    required this.heroKey,
  });

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage>
    with SingleTickerProviderStateMixin {
  late MovieDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(MovieDetailController(widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    final poster =
        '${ApiEndPoint.imageBaseUrl("400")}${widget.movie.posterPath}';
    return Scaffold(
      backgroundColor: theme.scaffoldBg,
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster
                  Stack(
                    children: [
                      Hero(
                        tag: "${widget.heroKey}_${widget.movie.id}",
                        child: CachedNetworkImage(
                          imageUrl: poster,
                          // cacheManager: controller.customCacheManager,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => Container(
                                color: theme.overlayBg,
                                height: 400,
                                child: const Center(child: CustomLoading()),
                              ),
                          errorWidget: (context, url, error) {
                            return Container(
                              height: 400,
                              color: theme.overlayBg,
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 40,
                              ),
                            );
                          },
                        ),
                      ),

                      // Overlay
                      Positioned.fill(
                        child: Obx(() {
                          return AnimatedOpacity(
                            opacity: controller.overlayOpacity.value,
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withAlpha(0.3.toAlpha),
                                    Colors.black,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                      // Title over Poster
                      Positioned(
                        bottom: 24,
                        left: 16,
                        right: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.movie.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            8.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Release: ${widget.movie.releaseDate != null ? DateFormat('MMMM d, y').format(widget.movie.releaseDate!.toLocal()) : 'Unknown'}',
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                                4.widthBox,
                                Text(
                                  widget.movie.adult ? '| R' : ' | PG-13',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  20.heightBox,

                  //Detail Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Obx(() {
                      if (controller.xLoading.value) {
                        return DetailShimmer();
                      }

                      final detail = controller.detailModel.value;
                      if (detail == null) {
                        return Center(
                          child: Text(
                            "Failed to load details",
                            style: TextStyle(color: theme.textSecond),
                          ),
                        );
                      }

                      return DetailSection(detail: detail);
                    }),
                  ),
                  (MediaQuery.of(context).padding.bottom + 15).heightBox,
                ],
              ),
            ),
          ),

          // Back Key
          Positioned(
            top: 8 + MediaQuery.of(context).padding.top,
            left: 8,
            child: WiggleButton(
              onTap: () => Get.back(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  TablerIcons.chevron_left,
                  color: theme.iconMain,
                  size: 23,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
