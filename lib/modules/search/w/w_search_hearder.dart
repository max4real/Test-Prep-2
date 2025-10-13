import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/w_wiggle_button.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';
import 'package:get/get.dart';

class SearchHearder extends StatefulWidget {
  final bool searchIconInclude;
  final Color iconColor;
  final Color textColor;
  final Color hintTextColor;
  final Color seachBtnBg;
  final Color textFieldBg;
  final String? prefixValue;
  final TextEditingController txtController;
  final Function(String serchValue) onTapSerch;
  final Function(String serchValue) onChanged;

  const SearchHearder({
    super.key,
    this.prefixValue,
    required this.onTapSerch,
    required this.onChanged,
    required this.txtController,
    this.iconColor = AppColor.iconMain,
    this.textColor = AppColor.textMain,
    this.seachBtnBg = Colors.white,
    this.textFieldBg = AppColor.postBg,
    this.hintTextColor = AppColor.textSecond,
    this.searchIconInclude = true,
  });

  @override
  State<SearchHearder> createState() => _SearchHearderState();
}

class _SearchHearderState extends State<SearchHearder>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_updateState);
    widget.txtController.addListener(_updateState);
  }

  void _updateState() {
    final hasText = widget.txtController.text.trim().isNotEmpty;
    // final shouldShrink = _focusNode.hasFocus || hasText;

    if (_hasFocus != _focusNode.hasFocus || _hasText != hasText) {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
        _hasText = hasText;
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.txtController.removeListener(_updateState);
    super.dispose();
  }

  void _submitSearch() {
    final query = widget.txtController.text.trim();
    if (query.isNotEmpty) {
      widget.onTapSerch(query);
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final shouldShrink = _hasFocus || _hasText;
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 15),
      child: Row(
        children: [
          WiggleButton(
            onTap: () => Get.back(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: theme.overlayBg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                TablerIcons.chevron_left,
                color: theme.iconMain,
                size: 23,
              ),
            ),
          ),
          10.widthBox,
          if (widget.searchIconInclude)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              width: shouldShrink ? 0 : 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.overlayBg,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                  ),
                  child: Icon(Icons.search, color: theme.iconMain, size: 24),
                ),
              ),
            ),
          Expanded(
            child: Stack(
              children: [
                // Actual TextField
                TextField(
                  controller: widget.txtController,
                  focusNode: _focusNode,
                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                  onSubmitted: (_) => _submitSearch(),
                  style: TextStyle(
                    color: theme.textMain,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  onChanged: widget.onChanged,
                  decoration: InputDecoration(
                    hintText: widget.prefixValue ?? "Search for movies...",
                    hintStyle: TextStyle(
                      color: widget.hintTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(3),
                      child: WiggleButton(
                        onTap: _submitSearch,
                        child: Container(
                          height: 34,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: theme.scaffoldBg,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            'Search',
                            style: TextStyle(
                              color: theme.textMain,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: theme.overlayBg,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          (widget.searchIconInclude && !shouldShrink)
                              ? const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )
                              : BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
