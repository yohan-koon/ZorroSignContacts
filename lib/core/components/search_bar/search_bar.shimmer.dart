import 'package:finap_base_theme/palette.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarShimmer extends StatelessWidget {
  final EdgeInsets? margin;
  const SearchBarShimmer({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              height: 2.w,
            ),
          )
        ],
      ),
    );
  }
}
