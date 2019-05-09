import 'package:flutter/material.dart';
import '../painters/ChessPainter.dart';

class CustomPaintPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(300, 300),
          painter: ChessPainter(),
        ),
      ),
    );
  }
}
