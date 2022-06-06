import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/contact_repository.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.params.dart';

class CreateContactUseCase
    extends UseCase<Contact?, CreateContactUsecaseParams> {
  late final ContactRepository repository;
  CreateContactUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, Contact?>> call(
      CreateContactUsecaseParams params) async {
   return await repository.create(params);
  }
}