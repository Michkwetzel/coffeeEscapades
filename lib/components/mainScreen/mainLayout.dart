import 'package:coffee_escapades/components/buttons/buttonsRow.dart';
import 'package:coffee_escapades/components/mainScreen/components/bottomTextWidget.dart';
import 'package:coffee_escapades/components/mainScreen/components/coffeeMugWidget.dart';
import 'package:coffee_escapades/components/mainScreen/components/topWidget.dart';
import 'package:coffee_escapades/config/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

class MainLayout extends ConsumerStatefulWidget {
  MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends ConsumerState<MainLayout> {
  // Hi and welcome to my Code
  // Honestly. THe pdf display widget i just asked Claude. 
  // I tried with the pdf packages but it just wouldnt load my pdf and at 5pm I just wanted to send it to you guys
  // Anyways: This is my main layout. Enjoy!
  final Color cupColor = Color(0xFF336334);
  final double cupSideWidth = 4;
  final int handleSideWidth = 10;

  late html.IFrameElement _iframeElement;
  final String viewID = 'pdf-viewer-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _iframeElement = html.IFrameElement()
      ..style.border = 'none'
      ..style.height = '100%'
      ..style.width = '100%'
      ..src = 'assets/Flutter_Mike_CV_compressed.pdf';

    ui_web.platformViewRegistry.registerViewFactory(viewID, (int viewId) => _iframeElement);
  }

  @override
  Widget build(BuildContext context) {
    final isBrewingFinished = ref.watch(brewingStateProvider).finished;

    return Column(
      children: [
        const SizedBox(height: 40),
        TopWidget(),
        Expanded(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 800),
            transitionBuilder: (Widget child, Animation<double> animation) {
              // Slide and fade animation
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0), // Slide from right
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
            child: isBrewingFinished ? _buildPdfSection() : _buildCoffeeSection(),
          ),
        ),
      ],
    );
  }

  Widget _buildPdfSection() {
    return Center(
      child: Container(
        key: const ValueKey('pdf'),
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: HtmlElementView(
            viewType: viewID,
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeSection() {
    return Container(
      key: ValueKey('coffee'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
