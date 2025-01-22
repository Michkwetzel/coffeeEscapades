// State management
import 'package:coffee_escapades/notifiers/brewingNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brewingStateProvider = StateNotifierProvider<BrewingNotifier, BrewingState>((ref) {
  return BrewingNotifier();
});
