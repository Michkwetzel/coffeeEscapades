import 'package:coffee_escapades/components/mainScreen/mainLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GradientBackground extends ConsumerStatefulWidget {
  @override
  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends ConsumerState<GradientBackground> {
  int currentValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Creates Gradient for background

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF6BE78),
              Color(0xFFF3F0E8),
              Color(0xFFC4D4ED),
            ],
            stops: [0, 0.5, 0.9],
          ),
        ),
        child: MainLayout(),
      ),
    );
  }
}
