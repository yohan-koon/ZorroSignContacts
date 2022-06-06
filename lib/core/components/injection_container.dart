import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector_helper.dart';
import 'package:zorro_sign_contacts/core/components/message/message_helper.dart';

Future<void>? setup(GetIt di) async {
  di.registerLazySingleton(() => ImageCapturingSourceSelectorHelper());
  di.registerLazySingleton(() => MessageHelper());
}
