import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  const Seperator({Key? key, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Palette.LIGHT_GREY,
      height: height ?? 0,
      width: width ?? 0,
    );
  }
}
