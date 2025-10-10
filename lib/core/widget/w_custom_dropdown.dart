import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T? initialValue;
  final String hintText;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final IconData? icon;

  const CustomDropdown({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return DropdownButtonFormField<T>(
      value: initialValue,
      onChanged: onChanged,
      isExpanded: true,
      icon: Icon(TablerIcons.arrow_down, size: 22, color: theme.iconMain),
      dropdownColor: theme.overlayBg,
      borderRadius: BorderRadius.circular(16),
      menuMaxHeight: 300,
      style: TextStyle(
        color: theme.textMain,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: theme.overlayBg,
        hintText: hintText,
        prefixIcon:
            icon != null ? Icon(icon, color: Colors.grey[600], size: 20) : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.overlayBg),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.overlayBg),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.mainColor, width: 1.5),
        ),
      ),
      items:
          items.map((item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                item.toString(),
                style: TextStyle(color: theme.textMain, fontSize: 14),
              ),
            );
          }).toList(),
    );
  }
}
