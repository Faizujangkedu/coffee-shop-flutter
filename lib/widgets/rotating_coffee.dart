// widgets/rotating_coffee.dart

import 'dart:math' as math;
import 'package:flutter/material.dart';

class RotatingCoffee extends StatefulWidget {
  const RotatingCoffee({super.key});

  @override
  State<RotatingCoffee> createState() =>
      _RotatingCoffeeState();
}

class _RotatingCoffeeState extends State<RotatingCoffee>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        child: const Icon(
          Icons.coffee,
          size: 38,
          color: Color(0xFF6F4328),
        ),
        builder: (context, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
          );
        },
      ),
    );
  }
}
