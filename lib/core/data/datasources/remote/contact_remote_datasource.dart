import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.params.dart';

abstract class ContactRemoteDataSource {
  Future<List<Contact>?> getContacts();
  Future<Contact?> insert(CreateContactUsecaseParams params);
}
