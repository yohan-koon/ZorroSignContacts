import 'package:zorro_sign_contacts/core/data/datasources/remote/contact_remote_datasource.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:dartz/dartz.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/contact_repository.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.params.dart';
import 'package:zorro_sign_contacts/helpers/logger/logger.dart';
import 'package:finap_error_handling/errors/server_error.dart';
import 'package:finap_error_handling/error.dart';

class ContactRepositoryImpl extends ContactRepository {
  late final ContactRemoteDataSource remoteDataSource;
  late final Logger logger;

  ContactRepositoryImpl({required this.remoteDataSource, required this.logger});

  @override
  Future<Either<Error, List<Contact>?>> fetchAll() async {
    try {
      final response = await remoteDataSource.getContacts();
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
  Future<Either<Error, Contact?>> create(CreateContactUsecaseParams params) async {
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
}
