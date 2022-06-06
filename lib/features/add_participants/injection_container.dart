import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/add_participants/presentation/mobx/add_participants_store.dart';

Future<void>? setup(GetIt di) async {
  di.registerFactory(() => AddParticipantsStore(getContactsUseCase: di(),sharedStore: di()));
}
