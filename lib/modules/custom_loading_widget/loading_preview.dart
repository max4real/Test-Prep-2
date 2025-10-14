import 'package:flutter/material.dart';
import 'package:test_prep_2/modules/custom_loading_widget/inkdrop_loading_widget.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';

class LoadingPreview extends StatefulWidget {
  const LoadingPreview({super.key});

  @override
  State<LoadingPreview> createState() => _LoadingPreviewState();
}

class _LoadingPreviewState extends State<LoadingPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkDropLoading(
          size: 50,
          color: AppColor.secondColor,
          trackColor: Colors.grey.shade800,
        ),
      ),
    );
  }
}
