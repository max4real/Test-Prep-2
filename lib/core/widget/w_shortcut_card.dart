import 'package:flutter/material.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/w_wiggle_button.dart';

class ShortcutCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color cardColor;
  final VoidCallback onClick;

  const ShortcutCard({
    super.key,
    required this.title,
    required this.iconData,
    this.cardColor = const Color(0xFF4D65BC),
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return WiggleButton(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              cardColor,
              cardColor.withAlpha(0.9.toAlpha),
              cardColor.withAlpha(0.7.toAlpha),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: cardColor.withAlpha(0.25.toAlpha),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Colors.white, size: 20),
            8.widthBox,
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
