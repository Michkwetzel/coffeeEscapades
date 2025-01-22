import 'package:coffee_escapades/components/mainScreen/background/gradientBackground.dart';
import 'package:coffee_escapades/microServices/snackBarService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//
class CoffeeTimerApp extends StatelessWidget {
  const CoffeeTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GradientBackground(),
    );
  }
}

void main() {
  runApp(const ProviderScope(child: CoffeeTimerApp()));
}
