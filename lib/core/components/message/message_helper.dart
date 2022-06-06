import 'package:finap_base_theme/theme_variation_type.dart';
import 'package:flutter/material.dart';
import 'package:zorro_sign_contacts/core/components/message/message.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';
import 'package:finap_extensions/string_extension.dart';

class MessageHelper {
  void show({
    final String? title,
    required final String message,
    final String? submitButtonTitle,
    final Function? onTapSubmitCallback,
    required final BuildContext context,
    final bool? isDismissible,
    final bool? isDraggable,
    final ThemeVariationType? themeVariationType,
    final ThemeStore? ts,
  }) {
    //WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isDismissible: isDismissible ?? false,
        enableDrag: isDraggable ?? false,
        isScrollControlled: false,
        builder: (BuildContext bc) {
          return Message(
              title: title,
              message: message,
              submitButtonTitle: submitButtonTitle ?? context.i18n.defaultMessageSubmitBtnTitle,
              onTapSubmitCallback: onTapSubmitCallback,
              themeVariationType:
                  themeVariationType ?? ThemeVariationType.success,
              ts: ts);
        });
    //});
  }
}
