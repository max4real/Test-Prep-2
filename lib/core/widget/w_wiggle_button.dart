import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WiggleButton extends StatefulWidget {
  const WiggleButton({super.key, required this.onTap, required this.child});
  final Function() onTap;
  final Widget child;

  @override
  State<WiggleButton> createState() => _WiggleButtonState();
}

class _WiggleButtonState extends State<WiggleButton> {
  bool isTapdown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        HapticFeedback.lightImpact();
        widget.onTap();
        setState(() {
          isTapdown = true;
        });
        await Future.delayed(const Duration(milliseconds: 100));
        setState(() {
          isTapdown = false;
        });
      },
      child: AnimatedScale(
        duration: Duration(milliseconds: 100),
        scale: isTapdown ? 0.8 : 1,
        child: widget.child,
      ),
    );
  }
}
