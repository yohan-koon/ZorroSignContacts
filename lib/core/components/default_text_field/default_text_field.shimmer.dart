import 'package:finap_base_theme/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DefaultTextFieldShimmer extends StatelessWidget {
  final bool? isVisibleLabel;
  final EdgeInsets? margin;
  const DefaultTextFieldShimmer({Key? key, this.isVisibleLabel = false, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.only(top: 8.w),
      child: SizedBox(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isVisibleLabel == true ? Container(
              margin: EdgeInsets.only(top: 2.w),
              width: 50.w,
              height: 5.w,
              decoration: const BoxDecoration(
                  color: Palette.BLACK,
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  )),
            ): Container(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Palette.BLACK, width: 0.5.w),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
              margin: EdgeInsets.only(top: 2.w),
              child: SizedBox(
                width: 100.w,
                height: 3.5.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
