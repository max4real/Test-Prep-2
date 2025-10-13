import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/modules/home/w/w_rating.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';

class MovieCard extends StatelessWidget {
  final MovieCardModel movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl =
        movie.posterPath != null && movie.posterPath!.isNotEmpty
            ? '${ApiEndPoint.imageBaseUrl}${movie.posterPath}'
            : null;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Poster image
          if (posterUrl != null)
            CachedNetworkImage(
              imageUrl: posterUrl,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
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
            )
          else
            Container(
              color: Colors.grey[900],
              child: const Icon(
                Icons.broken_image,
                color: Colors.grey,
                size: 40,
              ),
            ),

          // Gradient overlay
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
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      TablerIcons.calendar,
                      color: Colors.white,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      movie.releaseDate!.year.toString(),
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
    );
  }
}
