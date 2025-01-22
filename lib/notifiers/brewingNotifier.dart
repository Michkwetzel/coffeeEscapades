import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrewingState {
  final bool isBrewingInProgress;
  final int brewingTimeInSeconds;
  final double coffeeLevel;
  final bool finished;

  BrewingState({
    this.isBrewingInProgress = false,
    this.brewingTimeInSeconds = 0,
    this.coffeeLevel = 0.0,
    this.finished = false,
  });

  BrewingState copyWith({
    bool? isBrewingInProgress,
    int? brewingTimeInSeconds,
    double? coffeeLevel,
    bool? finished,
  }) {
    return BrewingState(
      isBrewingInProgress: isBrewingInProgress ?? this.isBrewingInProgress,
      brewingTimeInSeconds: brewingTimeInSeconds ?? this.brewingTimeInSeconds,
      coffeeLevel: coffeeLevel ?? this.coffeeLevel,
      finished: finished ?? this.finished,
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
    );

    while (state.isBrewingInProgress) {
      await Future.delayed(const Duration(seconds: 1));
      updateBrewing(state.brewingTimeInSeconds + 1);

      if (state.brewingTimeInSeconds >= 3) {
        state = state.copyWith(isBrewingInProgress: false, finished: true);
        //SnackBarService.showMessage('You Coffee is done!', Colors.brown);
      }
    }
  }

  void updateBrewing(int seconds) {
    final progress = seconds / 3;
    state = state.copyWith(
      brewingTimeInSeconds: seconds,
      coffeeLevel: progress.clamp(0.0, 1.0),
    );
  }

  void stopBrewing() {
    state = state.copyWith(isBrewingInProgress: false);
  }
}
