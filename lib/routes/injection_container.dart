import 'package:zorro_sign_contacts/routes/router.gr.dart';
import 'package:get_it/get_it.dart';

Future<void> setup(GetIt di) async {
  di.registerLazySingleton(() => AppRouter());
}
