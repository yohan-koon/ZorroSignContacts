import 'package:dartz/dartz.dart';
import 'package:finap_error_handling/error.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.params.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.params.dart';

abstract class GroupRepository{
  Future<Either<Error, List<Group>?>> fetchAll();
  Future<Either<Error, Group?>> fetchById(GetGroupUsecaseParams params);
  Future<Either<Error, Group?>> create(CreateGroupUsecaseParams params);
  Future<Either<Error, Group?>> update(UpdateGroupUsecaseParams params);
}