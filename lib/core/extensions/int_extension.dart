import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension CustomBox on int {
  Widget get heightBox {
    return SizedBox(height: toDouble());
  }

  Widget get widthBox {
    return SizedBox(width: toDouble());
  }

  String get formatThousandSeparate {
    return NumberFormat("#,###").format(this);
  }

  String get toCompactString {
    if (this >= 1_000_000_000) {
      return _format(this / 1_000_000_000, 'B');
    } else if (this >= 1_000_000) {
      return _format(this / 1_000_000, 'M');
    } else if (this >= 1_000) {
      return _format(this / 1_000, 'K');
    } else {
      return toString();
    }
  }

  String get formatSeconds {
    final duration = Duration(seconds: this);

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
  }

  String _format(double value, String suffix) {
    final str = value.toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '');
    return '$str$suffix';
  }

  String get toLakhString {
    if (this >= 100000) {
      final lakh = this / 100000;
      return '${lakh.toStringAsFixed(lakh.truncateToDouble() == lakh ? 0 : 1)} lakh';
    } else {
      return toString();
    }
  }
}
