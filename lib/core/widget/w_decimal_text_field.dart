import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_prep_2/core/app_functions.dart';

class DecimalTextField extends StatefulWidget {
  final String title;
  final Function(int value)? onChanged; // optional callback
  const DecimalTextField({super.key, required this.title, this.onChanged});

  @override
  State<DecimalTextField> createState() => _DecimalTextFieldState();
}

class _DecimalTextFieldState extends State<DecimalTextField> {
  final TextEditingController _priceController = TextEditingController();
  final NumberFormat _numberFormat = NumberFormat.decimalPattern();

  int get rawValue {
    final raw = _priceController.text.replaceAll(',', '');
    return int.tryParse(raw) ?? 0;
  }

  @override
  void initState() {
    super.initState();

    _priceController.addListener(() {
      final raw = _priceController.text.replaceAll(',', '');
      if (raw.isEmpty) return;

      final value = int.tryParse(raw);
      if (value == null) return;

      final formatted = _numberFormat.format(value);

      // Avoid cursor jump
      _priceController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );

      widget.onChanged?.call(value); // fire callback
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          onTapOutside: (event) {
            dismissKeyboard();
          },
          decoration: InputDecoration(
            hintText: '0',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
