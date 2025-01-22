import 'package:coffee_escapades/components/glasmorphism/glassMorphismWrapper.dart';
import 'package:flutter/material.dart';

class TopTextWidget extends StatelessWidget {
  const TopTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassMorphismWrapper(
      child: Text('Smart Coffee Timer'),
    );
  }
}
