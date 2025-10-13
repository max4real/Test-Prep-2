import 'package:flutter/material.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/scaffold_container.dart';
import 'package:test_prep_2/core/widget/w_global_header.dart';
import 'package:test_prep_2/modules/home/w/w_movie_card.dart';
import 'package:test_prep_2/modules/popular/c/c_popular.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';
import 'package:get/get.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => PopularPageState();
}

class PopularPageState extends State<PopularPage> {
  late PopularController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(PopularController());
    controller.getInitMovieList();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.position.pixels >=
            (scrollController.position.maxScrollExtent - 200)) {
          controller.getMoreMovieList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    return ScaffoldContainer(
      bgColor: theme.scaffoldBg,
      child: Column(
        children: [
          10.heightBox,
          GlobalHeader(includePlus: false, title: 'Popular Movies'),
          Expanded(
            child: GetBuilder<PopularController>(
              builder: (controller) {
                if (controller.xListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (controller.allList.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data',
                      style: TextStyle(
                        color: theme.textMain,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  );
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.getInitMovieList();
                    },
                    child: GridView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.allList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.66,
                          ),
                      itemBuilder: (context, index) {
                        return MovieCard(movie: controller.allList[index]);
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
