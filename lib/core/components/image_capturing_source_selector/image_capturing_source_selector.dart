import 'package:finap_base_theme/theme_variation_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector_helper.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';

class ImageCapturingSourceSelector extends StatelessWidget {
  final Function(ImageCapturingType) onItemSelected;
  final Function onDismissed;
  final bool? isDismissible;
  final ThemeVariationType themeVariationType;

  const ImageCapturingSourceSelector({
    Key? key,
    required this.onItemSelected,
    required this.onDismissed,
    this.isDismissible,
    this.themeVariationType = ThemeVariationType.success,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(isDismissible ?? true);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w)),
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: <Widget>[_closeIcon(context), _renderButtons(context)],
          ),
        ),
      ),
    );
  }

  Widget _closeIcon(BuildContext context) {
    return isDismissible == true
        ? Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 6.w, top: 4.w),
              child: InkWell(
                onTap: () => _close(context),
                child: const Icon(Icons.close),
              ),
            ),
          )
        : Container();
  }

  Widget _renderButtons(BuildContext context) {
    return SafeArea(
      child: Column(children: <Widget>[
        ListTile(
            onTap: () {
              onItemSelected(ImageCapturingType.CAMERA);
              _close(context);
            },
            leading: const Icon(Icons.photo_camera),
            title: Text(
              "Take a picture from camera",
              style: Theme.of(context)
                  .primaryTextTheme
                  .labelSmall
                  ?.copyWith(fontSize: 15.sp),
            )),
        ListTile(
            onTap: () {
              onItemSelected(ImageCapturingType.PHOTO_LIBRARY);
              _close(context);
            },
            leading: const Icon(Icons.photo_library),
            title: Text("Choose from photo library",
                style: Theme.of(context)
                    .primaryTextTheme
                    .labelSmall
                    ?.copyWith(fontSize: 15.sp)))
      ]),
    );
  }

  void _close(BuildContext context) {
    Navigator.pop(context);
    onDismissed();
  }
}
