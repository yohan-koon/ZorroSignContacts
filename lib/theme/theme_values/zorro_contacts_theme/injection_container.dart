import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/components_theme_data.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/colors.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/font_sizes.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/fonts.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/text_themes.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/theme_config.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/dimensions.dart';
import 'package:get_it/get_it.dart';

Future<void>? setup(GetIt di) async {
  di.registerLazySingleton(() => Colors());
  di.registerLazySingleton(() => Fonts());
  di.registerLazySingleton(() => FontSizes());
  di.registerLazySingleton(() => TextThemes());
  di.registerLazySingleton(() => Dimensions());
  di.registerLazySingleton(() => ThemeConfig());
  di.registerLazySingleton(() => ComponentsThemeData(
      colors: di(), fonts: di(), textThemes: di(), dimensions: di()));
}
