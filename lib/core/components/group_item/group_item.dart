import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zorro_sign_contacts/core/base64/base64_data.dart';
import 'package:zorro_sign_contacts/core/components/avatar/avatar.dart';
import 'package:zorro_sign_contacts/core/components/group_item/group_item.shimmer.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/helpers/base64_utils/base64_utils.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';

class GroupItem extends StatelessWidget {
  final Group? data;
  final bool? isLoading;
  final Function(Group?)? onTapItem;
  const GroupItem({Key? key, this.data, this.isLoading, this.onTapItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? _renderShimmer(context)
        : _renderPressableContainer(context);
  }

  Widget _renderPressableContainer(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4.w),
        child: Stack(
          children: <Widget>[
            _renderBody(context),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (onTapItem != null) {
                      onTapItem!(data);
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Widget _renderBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Palette.WHITE, borderRadius: BorderRadius.circular(4.w)),
      padding: EdgeInsets.all(3.5.w),
      child: Row(
        children: [
          _renderAvatar(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: _renderName(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderShimmer(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Palette.WHISPER,
        highlightColor: Palette.LIGHT_GREY,
        enabled: isLoading == true,
        child: const GroupItemShimmer());
  }

  Widget _renderAvatar(BuildContext context) {
    return Avatar(
      size: 60,
      source: Base64Utils.convertBase64Image(
          data?.imageStr ?? Base64Data.DEFAULT_CAMERA),
    );
  }

  Widget _renderName(BuildContext context) {
    return Text(
      data?.groupName ?? context.i18n.groupItemDisplayName,
      style: Theme.of(context)
          .primaryTextTheme
          .headline5
          ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
    );
  }
}
