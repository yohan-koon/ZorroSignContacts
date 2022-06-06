import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zorro_sign_contacts/core/base64/base64_data.dart';
import 'package:zorro_sign_contacts/core/components/avatar/avatar.dart';
import 'package:zorro_sign_contacts/core/components/contact_item/contact_item.shimmer.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/helpers/base64_utils/base64_utils.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';

class ContactItem extends StatelessWidget {
  final Contact? data;
  final bool? isLoading;
  final Function(Contact?)? onTapItem;
  final Function(Contact?)? onTapAvatar;
  final bool? isCheckBoxSelected;
  const ContactItem({
    Key? key,
    this.data,
    this.isLoading,
    this.onTapItem,
    this.onTapAvatar,
    this.isCheckBoxSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? _renderShimmer(context)
        : (onTapAvatar == null
            ? _renderPressableItem(context)
            : _renderBody(context));
  }

  Widget _renderPressableItem(BuildContext context) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _renderName(context),
                  const SizedBox(
                    height: 8,
                  ),
                  _renderEmail(context)
                ],
              ),
            ),
          ),
          isCheckBoxSelected != null ? _renderCheckBox(context) : Container()
        ],
      ),
    );
  }

  Widget _renderShimmer(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Palette.WHISPER,
        highlightColor: Palette.LIGHT_GREY,
        enabled: isLoading == true,
        child: const ContactItemShimmer());
  }

  Widget _renderAvatar(BuildContext context) {
    return Avatar(
        onTap: () {
          if (onTapAvatar != null) {
            onTapAvatar!(data);
          }
        },
        size: 60,
        source: Base64Utils.convertBase64Image(
            data?.imageStr ?? Base64Data.DEFAULT_PROFILE));
  }

  Widget _renderName(BuildContext context) {
    return Text(
      data?.displayName ?? context.i18n.contactItemDisplayName,
      style: Theme.of(context)
          .primaryTextTheme
          .headline5
          ?.copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
    );
  }

  Widget _renderEmail(BuildContext context) {
    return Text(
      data?.email ?? context.i18n.contactItemDisplayEmail,
      style: Theme.of(context)
          .primaryTextTheme
          .bodySmall
          ?.copyWith(fontSize: 15.sp, fontWeight: FontWeight.w300),
    );
  }

  Widget _renderCheckBox(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      fillColor: isCheckBoxSelected == true
          ? MaterialStateProperty.all(Palette.GREEN)
          : MaterialStateProperty.all(Palette.GREY),
      value: isCheckBoxSelected ?? false,
      shape: const CircleBorder(),
      onChanged: (bool? value) {
        print('on changed on changed');
        // if (widget.selectedItemCallback != null) {
        //   widget.selectedItemCallback(value, widget.item);
        // }
      },
    );
  }
}
