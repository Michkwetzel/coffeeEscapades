import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassMorphismWrapper extends StatelessWidget {
  const GlassMorphismWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // For elevation
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 0.5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: GlassmorphicContainer(
        //Glasmorphism effect
        borderRadius: 20,
        blur: 20,
        padding: const EdgeInsets.all(40),
        alignment: Alignment.center,
        border: 0,
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFFFFFF).withOpacity(0.2),
            const Color.fromARGB(255, 160, 97, 33).withOpacity(0.2),
          ],
          stops: const [0.1, 1],
        ),
        borderGradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 183, 183, 183),
            Color.fromARGB(255, 183, 183, 183),
          ],
        ),
        width: 300,
        height: 40,
        child: child,
      ),
    );
  }
}
