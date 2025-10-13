import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/core/widget/w_wiggle_button.dart';
import 'package:test_prep_2/modules/home_main/c/c_home_main.dart';
import 'package:test_prep_2/modules/home_main/v/w_keep_alive_page.dart';
import 'package:test_prep_2/modules/home/v/v_home.dart';
import 'package:test_prep_2/modules/popular/v/v_popular.dart';
import 'package:test_prep_2/modules/upcoming/v/v_upcoming.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({super.key});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  final controller = Get.put(HomeMainController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Obx(
      () => Scaffold(
        backgroundColor: theme.scaffoldBg,
        body: PageView(
          controller: controller.pageController,
          onPageChanged: controller.onPageChanged,
          physics: const BouncingScrollPhysics(),

          children: [
            KeepAlivePage(child: HomePage()),
            KeepAlivePage(child: UpcomingPage()),
            KeepAlivePage(child: PopularPage()),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(0, 8, 0, bottomPadding),
          decoration: BoxDecoration(
            color: theme.scaffoldBg,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(0.08.toAlpha),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            children: List.generate(3, (index) {
              final isSelected = controller.selectedIndex.value == index;
              final icons = [
                TablerIcons.movie,
                TablerIcons.calendar_time,
                TablerIcons.flame,
              ];
              final labels = ['Now Showing', 'Upcoming', 'Popular'];

              return Expanded(
                child: WiggleButton(
                  onTap: () {
                    if (!isSelected) controller.changePage(index);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          icons[index],
                          size: 26,
                          color: isSelected ? theme.iconMain : theme.textThird,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          labels[index],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight:
                                isSelected ? FontWeight.w900 : FontWeight.w600,
                            color:
                                isSelected ? theme.textMain : theme.textThird,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
