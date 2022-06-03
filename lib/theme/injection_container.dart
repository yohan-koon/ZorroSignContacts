import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/theme/theme_values/injection_container.dart'
    as theme_values_di;

Future<void>? setup(GetIt di) async {
  theme_values_di.setup(di);
}
