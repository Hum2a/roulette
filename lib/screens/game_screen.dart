import 'dart:math';

import 'package:flutter/material.dart';
import '../widgets/roulette_wheel_painter.dart';
import '../widgets/roulette_betting_table.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
    );

    _controller.addListener(() {
      setState(() {
        _currentAngle = _animation.value;
      });
    });
  }

  void _spinWheel() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spin the Wheel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: _currentAngle,
              child: SizedBox(
                width: 300,
                height: 300,
                child: CustomPaint(
                  painter: RouletteWheelPainter(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _spinWheel,
              child: const Text('Spin the Wheel'),
            ),
            const SizedBox(height: 20),
            RouletteBettingTable(), // Replaced with custom betting table widget
          ],
        ),
      ),
    );
  }
}
