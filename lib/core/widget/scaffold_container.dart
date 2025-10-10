import 'package:flutter/material.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';

class ScaffoldContainer extends StatelessWidget {
  const ScaffoldContainer({
    super.key,
    this.resizeToAvoidBottomInset = false,
    this.bgColor = AppColor.scaffoldBg,
    required this.child,
    this.bottomSheet,
    this.appBar,
  });
  final bool resizeToAvoidBottomInset;
  final Widget child;
  final Color bgColor;
  final Widget? bottomSheet;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: bgColor,
      bottomSheet: bottomSheet,
      appBar: appBar,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SizedBox.expand(
          child: MediaQuery(data: const MediaQueryData(), child: child),
        ),
      ),
    );
  }
}
