import 'package:flutter/material.dart';
import 'package:test_prep_2/modules/custom_loading_widget/inkdrop_painter.dart';

class InkDropLoading extends StatefulWidget {
  final double size;
  final Color color;
  final Color trackColor;
  const InkDropLoading({
    super.key,
    this.size = 80,
    required this.color,
    required this.trackColor,
  });

  @override
  State<InkDropLoading> createState() => _InkDropLoadingState();
}

class _InkDropLoadingState extends State<InkDropLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> progress;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    progress = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: InkDropPainter(
              progress: progress.value,
              color: widget.color,
              trackColor: widget.trackColor,
            ),
          );
        },
      ),
    );
  }
}
