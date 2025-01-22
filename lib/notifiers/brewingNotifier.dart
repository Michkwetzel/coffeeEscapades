import 'package:coffee_escapades/microServices/snackBarService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrewingState {
  final bool isBrewingInProgress;
  final int brewingTimeInSeconds;
  final double coffeeLevel;
  final bool show;

  BrewingState({
    this.isBrewingInProgress = false,
    this.brewingTimeInSeconds = 0,
    this.coffeeLevel = 0.0,
    this.show = false,
  });

  BrewingState copyWith({
    bool? isBrewingInProgress,
    int? brewingTimeInSeconds,
    double? coffeeLevel,
    bool? show,
  }) {
    return BrewingState(
      isBrewingInProgress: isBrewingInProgress ?? this.isBrewingInProgress,
      brewingTimeInSeconds: brewingTimeInSeconds ?? this.brewingTimeInSeconds,
      coffeeLevel: coffeeLevel ?? this.coffeeLevel,
      show: show ?? this.show,
    );
  }
}

class BrewingNotifier extends StateNotifier<BrewingState> {
  BrewingNotifier() : super(BrewingState());

  void startBrewing() async {
    state = state.copyWith(
      isBrewingInProgress: true,
      brewingTimeInSeconds: 0,
      coffeeLevel: 0.0,
      show: true,
    );

    while (state.isBrewingInProgress) {
      await Future.delayed(Duration(seconds: 1));
      updateBrewing(state.brewingTimeInSeconds + 1);

      if (state.brewingTimeInSeconds >= 240) {
        state = state.copyWith(isBrewingInProgress: false);
        SnackBarService.showMessage('You Coffee is done!', Colors.brown);
      }
    }
  }

  void updateBrewing(int seconds) {
    final progress = seconds / 240;
    state = state.copyWith(
      brewingTimeInSeconds: seconds,
      coffeeLevel: progress.clamp(0.0, 1.0),
    );
  }

  void stopBrewing() {
    state = state.copyWith(isBrewingInProgress: false);
  }
}
