import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_web/apptheme.dart';

import 'entry_out_transition.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.animationIndex,
  });
  final Animation<double> animationIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return EntryOutTransition(
      entryAnimation: animationIndex,
      // outAnimation: outAnimationController,
      entryBeginOffset: const Offset(0, .5),
      outBeginOffset: const Offset(0, .5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          "Projects",
          style: AppTheme.appNameTitle.copyWith(
            fontSize: max(size.width * 0.035, 32),
          ),
        ),
      ),
    );
  }
}
