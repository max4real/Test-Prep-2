import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/w_custom_loading.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/modules/home/w/w_rating.dart';
import 'package:test_prep_2/modules/movie_detail/v/v_movie_detail.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';
import 'package:get/get.dart';

class MovieCard extends StatelessWidget {
  final MovieCardModel movie;
  final String heroKey;
  const MovieCard({super.key, required this.movie, required this.heroKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MovieDetailPage(movie: movie, heroKey: heroKey));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Poster
            Hero(
              tag: "${heroKey}_${movie.id}",
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiEndPoint.imageBaseUrl("300")}${movie.posterPath}',
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Container(
                      color: Colors.grey[900],
                      child: const Center(child: CustomLoading()),
                    ),
                errorWidget:
                    (context, url, error) => Container(
                      color: Colors.grey[900],
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
              ),
            ),

            // overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha(0.8.toAlpha),
                    Colors.transparent,
                    Colors.black.withAlpha(0.9.toAlpha),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),

            // rating
            Positioned(
              top: 8,
              right: 8,
              child: RatingBadge(rating: movie.voteAverage),
            ),

            //  title
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  if (movie.releaseDate != null) ...[
                    4.heightBox,
                    Row(
                      children: [
                        const Icon(
                          TablerIcons.calendar_filled,
                          color: Colors.white,
                          size: 14,
                        ),
                        4.widthBox,
                        Text(
                          movie.releaseDate!.year.toString(),
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        4.widthBox,
                        Text(
                          movie.adult ? '| R' : '| PG-13',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
