import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/w_custom_loading.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_movie_detail.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';

class ProductionListWidget extends StatelessWidget {
  final List<ProductionCompany> list;
  const ProductionListWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            list.map((g) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35,
                      width: 100,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ApiEndPoint.imageBaseUrl("200")}${g.logoPath ?? ''}',
                        fit: BoxFit.contain,
                        placeholder:
                            (context, url) =>
                                const Center(child: CustomLoading()),
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
                    5.heightBox,
                    Text(
                      g.name,
                      style: TextStyle(
                        color: theme.textMain,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
