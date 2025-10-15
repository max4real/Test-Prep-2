import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_cast_model.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';

class CastCard extends StatelessWidget {
  final CastModel castModel;
  const CastCard({super.key, required this.castModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiEndPoint.imageBaseUrl("200")}${castModel.profilePath}',
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Shimmer.fromColors(
                    baseColor: theme.shimmerBaseColor,
                    highlightColor: theme.shimmerHighlightColor,
                    child: Container(
                      height: 130,
                      width: 100,
                      decoration: BoxDecoration(
                        color: theme.overlayBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
                errorWidget:
                    (context, url, error) => Container(
                      decoration: BoxDecoration(
                        color: theme.overlayBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
              ),
            ),
          ),
          6.heightBox,
          Text(
            castModel.name,
            style: TextStyle(
              color: theme.textMain,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            castModel.character,
            style: TextStyle(
              color: theme.textSecond,
              fontWeight: FontWeight.w400,
            ),

            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
