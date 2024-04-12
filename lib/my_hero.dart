import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  const MyHero({super.key,required this.child,required  this.tag});
  final child;
  final tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: child,
    );
  }
}
