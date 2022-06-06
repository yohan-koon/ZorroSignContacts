import 'package:zorro_sign_contacts/theme/theme_values/base_images.dart';
import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/injection_container.dart'
    as mentoring_theme_di;

Future<void>? setup(GetIt di) async {
  mentoring_theme_di.setup(di);
  di.registerLazySingleton(() => BaseImages());
}
