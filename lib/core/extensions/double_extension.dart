import 'package:flutter/material.dart';

extension CustomBox on double {
  Widget get heightBox {
    return SizedBox(height: this);
  }

  Widget get widthBox {
    return SizedBox(width: this);
  }

  int get toAlpha {
    return (this * 255).toInt();
  }
}
