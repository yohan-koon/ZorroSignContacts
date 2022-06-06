import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.dart';
import 'package:zorro_sign_contacts/features/contact_form/presentation/mobx/contacts_form_store.dart';

Future<void>? setup(GetIt di) async {
  // CONTACT FORM STORE
  di.registerFactory(() => ContactsFormStore(validator: di(), createContactUseCase: di(), getGroupsUseCase: di()));

    //CREATE CONTACT USECASE
  di.registerFactory(() => CreateContactUseCase(
      repository: di()));
}
