import 'package:coffee_escapades/components/mainScreen/mainLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:html' as html;

class GradientBackground extends ConsumerStatefulWidget {
  @override
  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends ConsumerState<GradientBackground> {
  int currentValue = 0;
  bool _hasShownAlert = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasShownAlert && !isDesktop()) {
        _showMobileAlert();
      }
    });
  }

  void _showMobileAlert() {
    _hasShownAlert = true;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Not currently optimized for Mobile'),
        content: Text('Please view on desktop.'),
        actions: [
          TextButton(
            child: Text('Continue Anyways'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  bool isDesktop() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    // Check for mobile indicators first
    if (userAgent.contains('mobile') || userAgent.contains('android') || userAgent.contains('iphone') || userAgent.contains('ipad')) {
      return false;
    }
    return true;
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
