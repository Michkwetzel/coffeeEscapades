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
  final Color cupColor = Color(0xFF336334);
  final double cupSideWidth = 4;
  final int handleSideWidth = 10;
  
  late html.IFrameElement _iframeElement;
  final String viewID = 'pdf-viewer-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    // Initialize iframe
    _iframeElement = html.IFrameElement()
      ..style.border = 'none'
      ..style.height = '100%'
      ..style.width = '100%'
      ..src = 'assets/Flutter_Mike_CV_compressed.pdf';

    // Register the view
    ui_web.platformViewRegistry.registerViewFactory(
      viewID, 
      (int viewId) => _iframeElement
    );
  }

  @override
  Widget build(BuildContext context) {
    final isBrewingFinished = ref.watch(brewingStateProvider).finished;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: isBrewingFinished ? _buildPdfViewer() : _buildCoffeeLayout(),
    );
  }

  Widget _buildPdfViewer() {
    return Container(
      color: Colors.white,
      child: HtmlElementView(
        viewType: viewID,
      ),
    );
  }

  Widget _buildCoffeeLayout() {
    return Column(
      children: [
        const SizedBox(height: 40),
        TopWidget(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                CoffeeMugWidget(cupColor: cupColor, cupSideWidth: cupSideWidth),
                SizedBox(height: 20),
                ButtonsRow(),
                BottomTextWidget(),
                SizedBox(height: 100),
              ],
            ),
          ),
        )
      ],
    );
  }
}