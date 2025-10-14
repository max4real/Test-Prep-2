import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/scaffold_container.dart';
import 'package:test_prep_2/modules/home/w/w_movie_card.dart';
import 'package:test_prep_2/modules/home/w/w_movie_card_shimmer.dart';
import 'package:test_prep_2/modules/search/c/c_search.dart';
import 'package:test_prep_2/modules/search/w/w_search_hearder.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';
import 'package:test_prep_2/utli/controller/data_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late MovieSearchController controller;

  @override
  void initState() {
    controller = Get.put(
      MovieSearchController(
        cacheDuration: Get.find<DataController>().cacheDuration,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return ScaffoldContainer(
      bgColor: theme.scaffoldBg,
      child: Column(
        children: [
          10.heightBox,
          SizedBox(
            width: double.infinity,
            height: 40,
            child: SearchHearder(
              txtController: controller.txtSearch,
              onTapSerch: (value) {
                controller.searchMovies(value: value, isDirectSearch: true);
              },
              onChanged: (serchValue) {
                controller.onChange(serchValue);
              },
            ),
          ),
          8.heightBox,
          Text(
            'Results are cached for 30 minutes',
            style: TextStyle(
              color: theme.textSecond,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (controller.xLoading.value) {
                return GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.66,
                  ),
                  itemCount: 10,
                  itemBuilder: (_, __) => const MovieCardShimmer(),
                );
              }

              if (controller.query.value.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        TablerIcons.search,
                        size: 48,
                        color: theme.textSecond,
                      ),
                      8.heightBox,
                      Text(
                        'Start typing to search...',
                        style: TextStyle(color: theme.textMain),
                      ),
                    ],
                  ),
                );
              }

              if (controller.searchResults.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: theme.textSecond,
                      ),
                      8.heightBox,
                      Text(
                        'No search results found',
                        style: TextStyle(color: theme.textMain),
                      ),
                    ],
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.66,
                ),
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    movie: controller.searchResults[index],
                    heroKey: "fromSearch",
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
