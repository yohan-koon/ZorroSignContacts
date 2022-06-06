import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/no.params.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/group_repository.dart';

class GetGroupsUseCase
    extends UseCase<List<Group>?, NoParams> {
  late final GroupRepository repository;
  GetGroupsUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, List<Group>?>> call(
      NoParams params) async {
   return await repository.fetchAll();
  }
}