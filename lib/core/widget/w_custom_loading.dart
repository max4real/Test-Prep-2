import 'package:flutter/material.dart';
import 'package:test_prep_2/modules/custom_loading_widget/inkdrop_loading_widget.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    return InkDropLoading(
      size: 30,
      color: AppColor.secondColor,
      trackColor: theme.overlayBg,
    );
  }
}
