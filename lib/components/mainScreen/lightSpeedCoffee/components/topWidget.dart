// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_escapades/components/glasmorphism/glassMorphismWrapper.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:coffee_escapades/config/providers.dart';
import 'package:coffee_escapades/notifiers/brewingNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopWidget extends ConsumerWidget {
  const TopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BrewingState brewingState = ref.watch(brewingStateProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlassMorphismWrapper(
          child: Text(
            brewingState.finished ? 'LightSpeed CV' : 'LightSpeed Coffee',
            style: kTopWidgetTextStyle,
          ),
        ),
      ],
    );
  }
}
