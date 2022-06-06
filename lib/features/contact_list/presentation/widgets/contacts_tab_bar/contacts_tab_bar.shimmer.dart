import 'package:finap_base_theme/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactsTabBarShimmer extends StatelessWidget {
  final EdgeInsets? margin;
  const ContactsTabBarShimmer({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 48,
      child: Row(children: [
         Expanded(
            child: Container(
          margin: EdgeInsets.all(4.w),
          decoration: const BoxDecoration(
            color: Palette.BLACK,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(4.w),
          decoration: const BoxDecoration(
            color: Palette.BLACK,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(4.w),
          decoration: const BoxDecoration(
            color: Palette.BLACK,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(4.w),
          decoration: const BoxDecoration(
            color: Palette.BLACK,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ))
      ]),
    );
  }
}
