import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFFC8A9),
            Color(0xFFE6F0FF),
          ],
          // You can adjust the stops for more control
          stops: [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
