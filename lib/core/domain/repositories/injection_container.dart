import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/contact_repository.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/group_repository.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/impl/contact_repository_impl.dart';
import 'package:zorro_sign_contacts/core/domain/repositories/impl/group_repository_impl.dart';

Future<void>? setup(GetIt di) async {
  // CONTACT REPOSITORY
  di.registerLazySingleton<ContactRepository>(() =>
      ContactRepositoryImpl(remoteDataSource: di(), logger: di()));

  // GROUP REPOSITORY
  di.registerLazySingleton<GroupRepository>(() =>
      GroupRepositoryImpl(remoteDataSource: di(), logger: di()));
}
