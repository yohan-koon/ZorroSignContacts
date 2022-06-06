import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/landing/presentation/mobx/landing_store.dart';

Future<void>? setup(GetIt di) async {
  di.registerFactory(() => LandingStore(sharedStore: di()));
}
