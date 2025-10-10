import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

double getScreenScaleFactor({Size sampleUiSize = const Size(430, 932)}) {
  try {
    return ((Get.width / sampleUiSize.width) +
            (Get.height / sampleUiSize.height)) /
        2;
  } catch (e1) {
    return 1;
  }
}

void vibrateNow() {
  try {
    HapticFeedback.selectionClick();
    // HapticFeedback.heavyImpact();
  } catch (e1) {
    null;
  }
}
