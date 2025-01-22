import 'package:coffee_escapades/config/providers.dart';
import 'package:coffee_escapades/notifiers/brewingNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeMugWidget extends ConsumerWidget {
  const CoffeeMugWidget({
    super.key,
    required this.cupColor,
    required this.cupSideWidth,
  });

  final Color cupColor;
  final double cupSideWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Draws a coffee bas and handle using containers.
    //The actual coffee is an animated container used in a stack

    BrewingState brewingState = ref.watch(brewingStateProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 50,
        ),
        Container(
          width: 250,
          height: 330,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: cupColor, width: cupSideWidth),
              bottom: BorderSide(color: cupColor, width: cupSideWidth),
              right: BorderSide(color: cupColor, width: cupSideWidth),
              top: BorderSide(color: cupColor, width: 0.2),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: double.infinity,
                height: 330 * brewingState.coffeeLevel,
                decoration: BoxDecoration(
                  color: const Color(0xFF634933),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 100,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: cupColor, width: 10),
              bottom: BorderSide(color: cupColor, width: 10),
              right: BorderSide(color: cupColor, width: 10),
            ),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
