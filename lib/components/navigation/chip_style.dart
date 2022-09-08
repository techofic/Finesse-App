
import 'package:finesse/components/navigation/inspired/inspired.dart';
import 'package:flutter/material.dart';

class ChipStyle {
  final double? size;
  final Color? background;
  final Color? color;
  final bool? isHexagon;
  final bool? drawHexagon;
  final bool? convexBridge;
  final NotchSmoothness? notchSmoothness;

  const ChipStyle({
    this.size,
    this.background = Colors.blue,
    this.color,
    this.isHexagon,
    this.drawHexagon,
    this.convexBridge,
    this.notchSmoothness,
  });
}
