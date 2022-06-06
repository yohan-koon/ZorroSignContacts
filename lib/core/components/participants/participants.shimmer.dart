import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ParticipantSimmer extends StatelessWidget {
  final double? width;
  final double? height;

  const ParticipantSimmer({Key? key, this.width, this.height = 42})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 0.w,
      margin: EdgeInsets.only(top: 0.w),
      decoration: BoxDecoration(
          color: Palette.BLACK,
          borderRadius: BorderRadius.all(
            Radius.circular(2.w),
          )),
    );
  }
}
