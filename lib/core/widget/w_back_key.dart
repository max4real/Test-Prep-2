
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';

class BackKeyWidget extends StatelessWidget {
  const BackKeyWidget({
    super.key,
    this.onWillPop,
    this.icon = TablerIcons.arrow_left,
    this.bgColor = Colors.white,
    this.iconColor = Colors.black,
    this.borderColor = const Color(0xffe0e0e0),
  });
  final Function()? onWillPop;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        if (onWillPop != null) {
          onWillPop!();
        } else {
          Get.back();
        }
      },
      child: Container(
        width: 38,
        height: 38,
        margin: EdgeInsets.only(top: Platform.isAndroid ? 15 : 0),
        decoration: BoxDecoration(
          color: bgColor == Colors.white ? AppColor.scaffoldBg : bgColor,
          shape: BoxShape.circle,
          border: Border.all(
            color:
                borderColor == Color(0xffe0e0e0)
                    ? AppColor.borderColor
                    : borderColor,
          ),
        ),
        child: Icon(
          icon,
          color: iconColor == Colors.black ? AppColor.iconMain : iconColor,
          size: 20,
        ),
      ),
    );
  }
}
