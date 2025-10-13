import 'package:flutter/material.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(strokeWidth: 2, color: AppColor.mainColor);
  }
}
