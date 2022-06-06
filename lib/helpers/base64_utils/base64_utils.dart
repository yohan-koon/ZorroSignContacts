import 'dart:convert';
import 'dart:typed_data';

import 'package:zorro_sign_contacts/core/base64/base64_data.dart';

class Base64Utils {
  static Uint8List? convertBase64Image(String base64String) {
    try {
      if (base64String.isNotEmpty == true) {
        return const Base64Decoder().convert(base64String.split(',').last);
      }
      return Base64Decoder().convert(Base64Data.DEFAULT_CAMERA.split(',').last);
    } on Exception catch (err) {
      return Base64Decoder().convert(Base64Data.DEFAULT_CAMERA.split(',').last);
    }
  }
}
