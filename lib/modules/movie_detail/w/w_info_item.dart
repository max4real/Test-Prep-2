import 'package:flutter/material.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class InfoItemWidget extends StatelessWidget {
  final String label;
  final String value;
  const InfoItemWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return Column(
      children: [
        Text(label, style: TextStyle(color: theme.textMain, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(color: theme.textMain, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
