import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CircularButtonSimmer extends StatelessWidget {
  final double? size;

  const CircularButtonSimmer({Key? key, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      
      decoration: BoxDecoration(borderRadius: BorderRadius.circular((size ?? 24) / 2), color: Palette.GREY),
    );
  }
}
