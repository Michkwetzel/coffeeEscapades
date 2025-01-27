// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/mainScreen/cVLayout.dart';
import 'package:coffee_escapades/components/mainScreen/lightSpeedCoffeeLayout.dart';
import 'package:coffee_escapades/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainLayout extends ConsumerStatefulWidget {
  MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  // Hi and welcome to my Code
  // I dont have any comments and the design not responsive. Also it could be organized better.
  // But I dont have time. I already took 2 days off from my current project to design and build this.
  // Keep that in mind and then Enjoy!
  final Color cupColor = Color(0xFF336334);
  final double cupSideWidth = 4;
  final int handleSideWidth = 10;

  @override
  Widget build(BuildContext context) {
    final isBrewingFinished = ref.watch(brewingStateProvider).finished;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        Expanded(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubic,
                )),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: isBrewingFinished ? CVLayout() : LightSpeedCoffeeLayout(cupColor: cupColor, cupSideWidth: cupSideWidth),
          ),
        ),
      ],
    );
  }
}
