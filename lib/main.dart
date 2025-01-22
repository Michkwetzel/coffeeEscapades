import 'package:coffee_escapades/notifiers/brewingNotifier.dart';
import 'package:coffee_escapades/components/mainScreen/brewingScreen.dart';
import 'package:coffee_escapades/microServices/snackBarService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State management
final brewingStateProvider = StateNotifierProvider<BrewingNotifier, BrewingState>((ref) {
  return BrewingNotifier();
});

//
class CoffeeTimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnackBarService.scaffoldKey,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BrewingScreen(),
    );
  }
}

void main() {
  runApp(ProviderScope(child: CoffeeTimerApp()));
}
