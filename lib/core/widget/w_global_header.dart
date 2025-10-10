import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/w_wiggle_button.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class GlobalHeader extends StatelessWidget {
  final String title;
  final bool includePlus;
  final VoidCallback? onPlusClick;
  final Widget? preffix;
  final Widget? suffix;
  const GlobalHeader({
    super.key,
    this.title = 'Shwe Pyae Sone',
    this.suffix,
    this.preffix,
    this.includePlus = false,
    this.onPlusClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    return Container(
      width: Get.width,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          if (preffix != null) ...[preffix!, 10.widthBox],
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: theme.textMain,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'Times New Roman',
              ),
            ),
          ),
          Spacer(),
          if (includePlus)
            WiggleButton(
              onTap: () {
                if (onPlusClick != null) {
                  onPlusClick!();
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  TablerIcons.circle_plus,
                  color: theme.iconMain,
                  size: 23,
                ),
              ),
            ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool includePlus;
  final bool centerTitle;
  final VoidCallback? onPlusClick;
  final Widget? suffix;
  const CustomAppBar({
    super.key,
    this.title = 'Shwe Pyae Sone',
    this.suffix,
    this.includePlus = false,
    this.onPlusClick,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    return Container(
      width: Get.width,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          WiggleButton(
            onTap: () {
              Get.back();
            },
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
          if (centerTitle) Spacer() else 10.widthBox,
          Text(
            title,
            style: TextStyle(
              color: theme.textMain,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (includePlus)
            WiggleButton(
              onTap: () {
                if (onPlusClick != null) {
                  onPlusClick!();
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: theme.overlayBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  TablerIcons.circle_plus,
                  color: theme.iconMain,
                  size: 23,
                ),
              ),
            ),
          if (suffix != null) suffix!,
        ],
      ),
    );
  }
}
