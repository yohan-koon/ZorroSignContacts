import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/group_repository.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.params.dart';

class UpdateGroupUseCase
    extends UseCase<Group?, UpdateGroupUsecaseParams> {
  late final GroupRepository repository;
  UpdateGroupUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, Group?>> call(
      UpdateGroupUsecaseParams params) async {
   return await repository.update(params);
  }
}