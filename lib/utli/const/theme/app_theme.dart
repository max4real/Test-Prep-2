import 'package:flutter/material.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

const String defaultFont = 'Inter';
// const String defaultMMfont = 'Book';

class CustomTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    // primarySwatch:
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColor.mainColor,
      brightness: Brightness.light,
      primarySwatch: MaterialColor(AppColor.mainColor.toARGB32(), const {
        050: Color.fromRGBO(29, 44, 77, .1),
        100: Color.fromRGBO(29, 44, 77, .2),
        200: Color.fromRGBO(29, 44, 77, .3),
        300: Color.fromRGBO(29, 44, 77, .4),
        400: Color.fromRGBO(29, 44, 77, .5),
        500: Color.fromRGBO(29, 44, 77, .6),
        600: Color.fromRGBO(29, 44, 77, .7),
        700: Color.fromRGBO(29, 44, 77, .8),
        800: Color.fromRGBO(29, 44, 77, .9),
        900: Color.fromRGBO(29, 44, 77, 1),
      }),
    ),
    // fontFamily: 'Euclid',
    fontFamily: defaultFont,
    // fontFamilyFallback: [defaultMMfont],
    // brightness: Brightness.light,
    dividerTheme: DividerThemeData(),
    tabBarTheme: TabBarThemeData(
      labelStyle: TextStyle(
        fontFamily: defaultFont,
        // fontFamilyFallback: [defaultMMfont],
      ),
    ),
    extensions: [
      ThemeExtras(
        scaffoldBg: Color(0xffFFFFFF),
        textMain: Color(0xff121212),
        textSecond: Color(0x80121212),
        textThird: Color(0x4d121212),
        text_70: Color(0xb3121212),
        iconMain: Color(0xff121212),
        disabledBtbFgColor: Color(0x80243B56),
        disabledBtbBgColor: Color(0xffe9ebee),
        overlayBg: Color(0xffF5F5F5),
        dividerColor: Color(0xfff2f2f2),
        locationBg: Color(0xffEDF2F5),
        clearIcon: Color(0xffB3B3B3),
        iconSecond: Color(0x80121212),
        dragHandleColor: Color(0x4d121212),
        shadow: Color(0x1a000000),
        switchActiveColor: Color(0xff0F172A),
        switchInactiveColor: Color(0xffD4D4D4),
        widgerOverlayBg: Color(0xffEDF2F5),
        dateBgColor: Color(0x1abababa),
        dateFgColor: Color(0xff243b56),
        otherBtnBg: Color(0xFF1A1E27),
      ),
    ],
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColor.mainColor,
      brightness: Brightness.dark,
      primarySwatch: MaterialColor(AppColor.mainColor.toARGB32(), const {
        050: Color.fromRGBO(29, 44, 77, .1),
        100: Color.fromRGBO(29, 44, 77, .2),
        200: Color.fromRGBO(29, 44, 77, .3),
        300: Color.fromRGBO(29, 44, 77, .4),
        400: Color.fromRGBO(29, 44, 77, .5),
        500: Color.fromRGBO(29, 44, 77, .6),
        600: Color.fromRGBO(29, 44, 77, .7),
        700: Color.fromRGBO(29, 44, 77, .8),
        800: Color.fromRGBO(29, 44, 77, .9),
        900: Color.fromRGBO(29, 44, 77, 1),
      }),
    ),
    // fontFamily: 'Euclid',
    fontFamily: defaultFont,
    // fontFamilyFallback: [defaultMMfont],
    // brightness: Brightness.dark,
    dividerTheme: DividerThemeData(),
    extensions: [
      ThemeExtras(
        scaffoldBg: Color(0xff1D1E22),
        textMain: Color(0xffeeeeee),
        textSecond: Color(0x80eeeeee),
        textThird: Color(0x4deeeeee),
        iconMain: Color(0xffeeeeee),
        disabledBtbFgColor: Color(0x80CACACA),
        disabledBtbBgColor: Color(0xff2b2b2b),
        overlayBg: Color(0xff252525),
        dividerColor: Color(0xff3a3a3a),
        locationBg: Color(0xff343434),
        clearIcon: Color(0xff868686),
        iconSecond: Color(0x80eeeeee),
        dragHandleColor: Color(0x4deeeeee),
        dateBgColor: Color(0xff2E2E32),
        dateFgColor: Color(0xffdefcfb),
        text_70: Color(0xb3eeeeee),
        shadow: Color(0x1a000000),
        switchActiveColor: AppColor.mainColor,
        switchInactiveColor: Color(0xff3C3C3C),
        widgerOverlayBg: Color(0xff3a3a3a),
        otherBtnBg: Color(0xffeeeeee),
      ),
    ],
  );
}
