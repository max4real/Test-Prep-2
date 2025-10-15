import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  const RatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: Color(0xff252525),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(TablerIcons.star_filled, color: AppColor.secondColor, size: 14),
          4.widthBox,
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
