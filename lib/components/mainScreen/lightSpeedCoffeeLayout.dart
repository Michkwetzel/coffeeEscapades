// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffee_escapades/components/buttons/buttonsRow.dart';
import 'package:coffee_escapades/components/mainScreen/lightSpeedCoffee/components/bottomTextWidget.dart';
import 'package:coffee_escapades/components/mainScreen/lightSpeedCoffee/components/coffeeMugWidget.dart';
import 'package:coffee_escapades/components/mainScreen/lightSpeedCoffee/components/topWidget.dart';
import 'package:flutter/material.dart';

class LightSpeedCoffeeLayout extends StatelessWidget {
  const LightSpeedCoffeeLayout({
    super.key,
    required this.cupColor,
    required this.cupSideWidth,
  });

  final Color cupColor;
  final double cupSideWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey('coffee'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopWidget(),
          const SizedBox(height: 40),
          CoffeeMugWidget(cupColor: cupColor, cupSideWidth: cupSideWidth),
          const SizedBox(height: 20),
          const ButtonsRow(),
          const BottomTextWidget(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
