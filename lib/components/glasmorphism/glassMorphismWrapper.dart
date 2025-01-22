import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassMorphismWrapper extends StatelessWidget {
  const GlassMorphismWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      
      borderRadius: 20,
      blur: 20,
      padding: EdgeInsets.all(40),
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
        Color(0xFFffffff).withOpacity(0.2),
        Color(0xFFFFFFFF).withOpacity(0.2),
      ], stops: [
        0.1,
        1,
      ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      width: 300,
      height: 40,
      child: child,
    );
  }
}
