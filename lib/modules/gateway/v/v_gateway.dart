import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/core/extensions/double_extension.dart';
import 'package:test_prep_2/core/extensions/int_extension.dart';
import 'package:test_prep_2/core/widget/scaffold_container.dart';
import 'package:test_prep_2/modules/gateway/c/c_gateway_controller.dart';
import 'package:test_prep_2/utli/const/theme/app_color.dart';
import 'package:test_prep_2/utli/const/theme/m_theme_data.dart';

class GatewayPage extends StatefulWidget {
  const GatewayPage({super.key});

  @override
  State<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends State<GatewayPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    Get.put(GatewayController()).checkPoint();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeExtras>()!;

    return ScaffoldContainer(
      bgColor: theme.scaffoldBg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Get.width.widthBox,
          Expanded(
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: theme.scaffoldBg.withAlpha(0.2.toAlpha),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Text(
                    'MovieDB',
                    style: TextStyle(
                      color: AppColor.secondColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            '© 2025 MovieDB. All rights reserved.',
            style: TextStyle(
              color: theme.textSecond,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          10.heightBox,
        ],
      ),
    );
  }
}
