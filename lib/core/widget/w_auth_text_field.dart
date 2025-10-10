import 'package:flutter/material.dart';
import 'package:test_prep_2/core/app_functions.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? icon;
  final String hint;
  final TextInputType? inputType;
  final bool obscure;
  final Widget? suffixIcon;
  final int maxAndMinLine;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.icon,
    this.inputType,
    this.obscure = false,
    this.suffixIcon,
    this.maxAndMinLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;
    return TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: inputType,
      onTapOutside: (_) => dismissKeyboard(),
      maxLines: maxAndMinLine,
      minLines: maxAndMinLine,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, color: Colors.grey[600]) : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: theme.overlayBg,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 14,
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
    );
  }
}
