import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zorro_sign_contacts/core/components/circular_button/circular_button_shimmer.dart';

class CircularButton extends StatelessWidget {
  final double size;
  final IconData? iconData;
  final Function? onTap;
  final bool? isLoading;
  const CircularButton(
      {Key? key,
      this.size = 48,
      required this.iconData,
      this.onTap,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: isLoading == true ? renderShimmer() : renderBody(context),
    );
  }

  Widget renderBody(BuildContext context) {
    return Stack(
        children: <Widget>[
          _renderAvatar(context),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(onTap: () {
                if (onTap != null) {
                  onTap!();
                }
              }),
            ),
          ),
        ],
      );
  }

  renderShimmer() {
    return Shimmer.fromColors(
        baseColor: Palette.WHISPER,
        highlightColor: Palette.GREY,
        enabled: isLoading == true,
        child: CircularButtonSimmer(
          size: 76 / 5,
        ));
  }

  Widget _renderAvatar(BuildContext context) {
    return Container(
        height: size,
        width: size,
        color: Palette.SLATE_GRAY.withOpacity(0.2),
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size / 2),
            color: Palette.WHITE,
          ),
          child: Padding(
            padding: EdgeInsets.all(size / 14),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular((size - ((size / 14) * 2)) / 2),
              child: Container(
                color: Palette.LIGHT_GREY,
                child: Padding(
                  padding: EdgeInsets.all(size / 6),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular((size - ((size / 14) * 2)) / 2),
                    child: Container(
                      color: Palette.GREEN,
                      child: iconData != null
                          ? Icon(
                              iconData ?? Icons.plus_one,
                              color: Palette.WHITE,
                            )
                          : Container(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
