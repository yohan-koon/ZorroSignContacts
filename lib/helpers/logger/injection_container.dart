import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/helpers/logger/crashlytics_logger.dart';
import 'package:zorro_sign_contacts/helpers/logger/logger.dart';

Future<void>? setup(GetIt di) async {
  //crashlytics logger
  di.registerLazySingleton<Logger>(() => CrashlyticsLogger());
}
