import 'package:coffee_escapades/components/buttons/customButton.dart';
import 'package:coffee_escapades/config/providers.dart';
import 'package:coffee_escapades/notifiers/brewingNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonsRow extends ConsumerWidget {
  // Row with buttons
  const ButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BrewingState brewingState = ref.watch(brewingStateProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customButton(
          onPressed: brewingState.isBrewingInProgress ? null : () => ref.read(brewingStateProvider.notifier).startBrewing(),
          buttonText: "Start Brewing",
          color: const Color(0xFFDBC1AC),
        ),
        const SizedBox(width: 20),
        customButton(
          onPressed: brewingState.isBrewingInProgress ? () => ref.read(brewingStateProvider.notifier).stopBrewing() : null,
          buttonText: "Stop",
          color: Colors.white,
        ),
      ],
    );
  }
}
