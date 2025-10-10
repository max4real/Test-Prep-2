import 'package:flutter/material.dart';

class ThemeExtras extends ThemeExtension<ThemeExtras> {
  final Color scaffoldBg;
  final Color textMain;
  final Color textSecond;
  final Color textThird;
  final Color iconMain;
  final Color iconSecond;

  final Color disabledBtbFgColor;
  final Color disabledBtbBgColor;
  final Color overlayBg;
  final Color widgerOverlayBg;
  final Color dividerColor;
  final Color locationBg;
  final Color clearIcon;
  final Color dragHandleColor;
  final Color shadow;
  final Color switchActiveColor;
  final Color switchInactiveColor;
  final Color text_70;
  final Color dateBgColor;
  final Color dateFgColor;
  final Color otherBtnBg;

  ThemeExtras({
    required this.scaffoldBg,
    required this.textMain,
    required this.textSecond,
    required this.textThird,
    required this.iconMain,
    required this.iconSecond,
    required this.disabledBtbFgColor,
    required this.disabledBtbBgColor,
    required this.overlayBg,
    required this.dividerColor,
    required this.locationBg,
    required this.clearIcon,
    required this.dragHandleColor,
    required this.shadow,
    required this.switchActiveColor,
    required this.switchInactiveColor,
    required this.text_70,
    required this.widgerOverlayBg,
    required this.dateBgColor,
    required this.dateFgColor,
    required this.otherBtnBg,
  });
  @override
  ThemeExtension<ThemeExtras> copyWith() {
    return ThemeExtras(
      scaffoldBg: scaffoldBg,
      textMain: textMain,
      textSecond: textSecond,
      textThird: textThird,
      iconMain: iconMain,
      iconSecond: iconSecond,
      disabledBtbFgColor: disabledBtbFgColor,
      disabledBtbBgColor: disabledBtbBgColor,
      overlayBg: overlayBg,
      dividerColor: dividerColor,
      locationBg: locationBg,
      clearIcon: clearIcon,
      dragHandleColor: dragHandleColor,
      shadow: shadow,
      switchActiveColor: switchActiveColor,
      switchInactiveColor: switchInactiveColor,
      text_70: text_70,
      widgerOverlayBg: widgerOverlayBg,
      dateBgColor: dateBgColor,
      dateFgColor: dateFgColor,
      otherBtnBg: otherBtnBg,
    );
  }

  @override
  ThemeExtension<ThemeExtras> lerp(
    covariant ThemeExtension<ThemeExtras>? other,
    double t,
  ) {
    if (other is! ThemeExtras) return this;
    return ThemeExtras(
      scaffoldBg: scaffoldBg,
      textMain: textMain,
      textSecond: textSecond,
      textThird: textThird,
      iconMain: iconMain,
      iconSecond: iconSecond,
      disabledBtbFgColor: disabledBtbFgColor,
      disabledBtbBgColor: disabledBtbBgColor,
      overlayBg: overlayBg,
      dividerColor: dividerColor,
      locationBg: locationBg,
      clearIcon: clearIcon,
      dragHandleColor: dragHandleColor,
      shadow: shadow,
      switchActiveColor: switchActiveColor,
      switchInactiveColor: switchInactiveColor,
      text_70: text_70,
      widgerOverlayBg: widgerOverlayBg,
      dateBgColor: dateBgColor,
      dateFgColor: dateFgColor,
      otherBtnBg: otherBtnBg,
    );
  }
}
