import 'package:coffee_escapades/components/buttons/CalltoActionButton.dart';
import 'package:coffee_escapades/notifiers/brewingNotifier.dart';
import 'package:coffee_escapades/config/constants.dart';
import 'package:coffee_escapades/components/glasmorphism/glassMorphismWrapper.dart';
import 'package:coffee_escapades/components/mainScreen/gradientBackground.dart';
import 'package:coffee_escapades/main.dart';
import 'package:coffee_escapades/components/mainScreen/topTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BrewingScreen extends ConsumerStatefulWidget {
  @override
  _BrewingScreenState createState() => _BrewingScreenState();
}

class _BrewingScreenState extends ConsumerState<BrewingScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;
  final double _maxScroll = 10000.0; // A large number for "infinite" scroll

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
          if (_scrollController.offset >= _maxScroll - 1000) {
            _scrollController.jumpTo(0);
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    BrewingState brewingState = ref.watch(brewingStateProvider);

    // Calculate gradient colors based on normalized scroll position
    final scrollProgress = (_scrollOffset % (MediaQuery.of(context).size.height * 2)) / (MediaQuery.of(context).size.height * 2);

    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            constraints: BoxConstraints(
              minHeight: _maxScroll,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFDCD91), // Soft blue-white
                  Color(0xFFD6C3B6), // Cool taupe
                  Color(0xFFC4A484), // Rich coffee brown
                  Color(0xFFAA8B78), // Deep cool brown
                  Color(0xFFC4A484), // Rich coffee brown (repeated for smooth transition)
                ],
                stops: [0.0, 0.25, 0.5, 0.75, 1.0],
              ),
            ),
          ),
        ),
        MainScreen(brewingState: brewingState, ref: ref),
      ]),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
    required this.brewingState,
    required this.ref,
  });

  final BrewingState brewingState;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlassMorphismWrapper(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Smart Coffee Timer',
                    style: TextStyle(fontFamily: "Mukta", fontWeight: FontWeight.w500, fontSize: 17),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          '${brewingState.brewingTimeInSeconds} seconds',
        ),
        Container(
          width: 240,
          height: 330,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: double.infinity,
                height: 330 * brewingState.coffeeLevel,
                decoration: BoxDecoration(
                  color: Color(0xFF634832),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 240,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomActionButton(
                onPressed: brewingState.isBrewingInProgress ? null : () => ref.read(brewingStateProvider.notifier).startBrewing(),
                buttonText: "Start Brewing",
                color: const Color(0xFFDBC1AC),
              ),
              SizedBox(width: 20),
              CustomActionButton(
                onPressed: brewingState.isBrewingInProgress ? () => ref.read(brewingStateProvider.notifier).stopBrewing() : null,
                buttonText: "Stop",
                color: Colors.white,
              ),
            ],
          ),
        ),
        brewingState.show
            ? Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      "While your coffee brews, please take a look at my Resume",
                      style: kH5PoppinsLight,
                    ),
                  ),
                ],
              )
            : const SizedBox(
                height: 40,
              ),
      ],
    );
  }
}
