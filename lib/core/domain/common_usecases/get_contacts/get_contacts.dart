import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/no.params.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/contact_repository.dart';

class GetContactsUseCase
    extends UseCase<List<Contact>?, NoParams> {
  late final ContactRepository repository;
  GetContactsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, List<Contact>?>> call(
      NoParams params) async {
   return await repository.fetchAll();
  }
}