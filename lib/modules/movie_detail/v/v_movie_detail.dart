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

class _MovieDetailPageState extends State<MovieDetailPage> {
  late MovieDetailController controller;

  @override
  void initState() {
    controller = Get.put(MovieDetailController(widget.movie));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        widget.movie.posterPath.isNotEmpty
            ? '${ApiEndPoint.imageBaseUrl("300")}${widget.movie.posterPath}'
            : null;
    final theme = Theme.of(context).extension<ThemeExtras>()!;

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
                      if (posterUrl != null)
                        Hero(
                          tag: "${widget.heroKey}_${widget.movie.id}",
                          child: CachedNetworkImage(
                            imageUrl: posterUrl,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            placeholder:
                                (context, url) => Container(
                                  color: Colors.grey[900],
                                  height: 400,
                                  child: const Center(child: CustomLoading()),
                                ),
                            errorWidget:
                                (context, url, error) => Container(
                                  height: 400,
                                  color: Colors.grey[900],
                                  child: const Icon(
                                    Icons.broken_image,
                                    color: Colors.grey,
                                    size: 40,
                                  ),
                                ),
                          ),
                        ),

                      // Overlay
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.6),
                                Colors.black,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
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
                            Text(
                              'Release: ${widget.movie.releaseDate != null ? DateFormat('MMMM d, y').format(widget.movie.releaseDate!.toLocal()) : 'Unknown'}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
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
                        return Text(
                          "Failed to load details",
                          style: TextStyle(color: theme.textMain),
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
