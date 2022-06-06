import 'package:flutter/material.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector.dart';

class ImageCapturingSourceSelectorHelper {
  void show({
    required final Function(ImageCapturingType type) onItemSelected,
    required final Function onDismissed,
    required final BuildContext context,
    final bool? isDismissible,
    final bool? isDraggable,
  }) {
    //WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: isDismissible ?? true,
        enableDrag: isDraggable ?? true,
        isScrollControlled: false,
        builder: (BuildContext bc) {
          return ImageCapturingSourceSelector(isDismissible: isDismissible,onItemSelected: onItemSelected, onDismissed: onDismissed);
        });
    //});
  }
}

enum ImageCapturingType{ CAMERA, PHOTO_LIBRARY}