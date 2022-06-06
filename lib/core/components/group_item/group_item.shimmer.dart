import 'package:finap_base_theme/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GroupItemShimmer extends StatelessWidget {
  final EdgeInsets? margin;
  const GroupItemShimmer({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.w),
          ),
          border: Border.all(
            color: Palette.GREY,
            width: 1,
          )),
      child: Row(
        children: [
          Container(
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              color: Palette.BLACK,
              borderRadius: BorderRadius.all(
                Radius.circular(6.w),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 4.w),
              child: Column(children: [
                Container(
                  height: 5.w,
                  decoration: const BoxDecoration(
                    color: Palette.BLACK,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
