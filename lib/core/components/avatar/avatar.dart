import 'dart:typed_data';

import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double size;
  final Uint8List? source;
  final Function? onTap;
  final bool? isVisibleClose;
  const Avatar(
      {Key? key,
      this.size = 48,
      required this.source,
      this.onTap,
      this.isVisibleClose = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: Stack(
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
      ),
    );
  }

  Widget _renderAvatar(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                  child: source != null
                      ? Image.memory(
                          source!,
                          gaplessPlayback: true,
                          fit: BoxFit.cover,
                        )
                      : Container(),
                ),
              ),
            )),
        Positioned(
            bottom: size / 8, right: size / 8, child: _renderClose(context))
      ],
    );
  }

  Widget _renderClose(BuildContext context) {
    return isVisibleClose == true
        ? Container(
            width: size / 4,
            height: size / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size / 4),
                color: Palette.GREY),
            child: Icon(
              Icons.close,
              size: size / 6,
              color: Palette.WHITE,
            ),
          )
        : Container(
            width: size / 4,
            height: size / 4,
          );
  }
}
