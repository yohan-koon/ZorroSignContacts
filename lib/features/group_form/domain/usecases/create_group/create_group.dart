import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/group_repository.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.params.dart';

class CreateGroupUseCase
    extends UseCase<Group?, CreateGroupUsecaseParams> {
  late final GroupRepository repository;
  CreateGroupUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, Group?>> call(
      CreateGroupUsecaseParams params) async {
   return await repository.create(params);
  }
}