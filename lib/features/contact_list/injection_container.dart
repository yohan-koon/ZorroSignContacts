import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/contact_list/presentation/mobx/contact_list_store.dart';

Future<void>? setup(GetIt di) async {
  di.registerFactory(() => ContactListStore(getContactsUseCase: di(),sharedStore: di()));
}
