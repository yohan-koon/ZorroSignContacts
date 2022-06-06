import 'package:zorro_sign_contacts/store/environment_store/environmental_store.dart';
import 'package:zorro_sign_contacts/store/shared_store/shared_store.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';
import 'package:zorro_sign_contacts/store/language_store/language_store.dart';
import 'package:get_it/get_it.dart';

Future<void> setup(GetIt di) async {
  di.registerLazySingleton(() => EnvironmentalStore());
  di.registerLazySingleton(() => ThemeStore());
  di.registerLazySingleton(() => LanguageStore());
  di.registerLazySingleton(() => SharedStore());
}
