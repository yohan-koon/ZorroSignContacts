import 'package:zorro_sign_contacts/core/data/datasources/remote/group_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/group_repository.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.params.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.params.dart';
import 'package:zorro_sign_contacts/helpers/logger/logger.dart';
import 'package:finap_error_handling/errors/server_error.dart';
import 'package:finap_error_handling/error.dart';

class GroupRepositoryImpl extends GroupRepository {
  late final GroupRemoteDataSource remoteDataSource;
  late final Logger logger;

  GroupRepositoryImpl({required this.remoteDataSource, required this.logger});

  @override
  Future<Either<Error, List<Group>?>> fetchAll() async {
    try {
      final response = await remoteDataSource.getGroups();
      if (response != null) {
        return Right(response);
      } else {
        return Left(ServerError(errorMessage: ''));
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Error, Group?>> fetchById(GetGroupUsecaseParams params) async {
    try {
      final response = await remoteDataSource.getGroupById(params);
      if (response != null) {
        return Right(response);
      } else {
        return Left(ServerError(errorMessage: ''));
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Error, Group?>> create(CreateGroupUsecaseParams params) async {
    try {
      final response = await remoteDataSource.insert(params);
      if (response != null) {
        return Right(response);
      } else {
        return Left(ServerError(errorMessage: ''));
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Error, Group?>> update(UpdateGroupUsecaseParams params) async {
    try {
      final response = await remoteDataSource.udpate(params);
      if (response != null) {
        return Right(response);
      } else {
        return Left(ServerError(errorMessage: ''));
      }
    } on Exception catch (e) {
      await logger.recordError(e);
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
