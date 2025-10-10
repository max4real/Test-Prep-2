import 'package:flutter/material.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';

extension HexColor on Color {
  String get toHex =>
      '#'
      // '${a.toAlpha.toRadixString(16).padLeft(2, '0')}'
      '${r.toAlpha.toRadixString(16).padLeft(2, '0')}'
      '${g.toAlpha.toRadixString(16).padLeft(2, '0')}'
      '${b.toAlpha.toRadixString(16).padLeft(2, '0')}';
}
