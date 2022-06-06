import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.params.dart';

abstract class ContactRepository{
  Future<Either<Error, List<Contact>?>> fetchAll();
  Future<Either<Error, Contact?>> create(CreateContactUsecaseParams params);
}