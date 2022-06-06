import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/usecase.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/group_repository.dart';

class GetGroupUseCase
    extends UseCase<Group?, GetGroupUsecaseParams> {
  late final GroupRepository repository;
  GetGroupUseCase({
    required this.repository,
  });

  @override
  Future<Either<Error, Group?>> call(
      GetGroupUsecaseParams params) async {
   return await repository.fetchById(params);
  }
}