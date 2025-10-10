import 'package:flutter/material.dart';

extension StringExtension on String? {
  String get capFirst {
    if (this == null || this!.isEmpty) return this ?? '';
    return this![0].toUpperCase() + this!.substring(1);
  }

  Color get toColor {
    try {
      final hex = (this ?? '').replaceFirst('#', '');
      String fullHex = hex.length == 6 ? 'FF$hex' : hex;
      return Color(int.parse(fullHex, radix: 16));
    } catch (e) {
      return Colors.black;
    }
  }

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNullOrWhiteSpace => this == null || this!.trim().isEmpty;
}
