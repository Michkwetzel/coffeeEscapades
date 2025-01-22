import 'package:coffee_escapades/components/buttons/buttonsRow.dart';
import 'package:coffee_escapades/components/mainScreen/components/bottomTextWidget.dart';
import 'package:coffee_escapades/components/mainScreen/components/coffeeMugWidget.dart';
import 'package:coffee_escapades/components/mainScreen/components/topWidget.dart';
import 'package:coffee_escapades/config/providers.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;  // Add this import
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  @override
  void initState() {
    super.initState();
    _iframeElement = html.IFrameElement()
      ..style.border = 'none'
      ..style.height = '100%'
      ..style.width = '100%'
      // Using PDF.js viewer
      ..src = 'https://mozilla.github.io/pdf.js/web/viewer.html?file=${Uri.encodeComponent('assets/Flutter_Mike_CV_compressed.pdf')}';
  }

  @override
  Widget build(BuildContext context) {
    final isBrewingFinished = ref.watch(brewingStateProvider).finished;

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: isBrewingFinished
          ? _buildPdfViewer()
          : _buildCoffeeLayout(),
    );
  }

  Widget _buildPdfViewer() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'pdf-viewer',
      (int viewId) => _iframeElement,
    );

    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: HtmlElementView(viewType: 'pdf-viewer'),
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