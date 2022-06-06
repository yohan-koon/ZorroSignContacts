import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/data/datasources/remote/contact_remote_datasource.dart';
import 'package:zorro_sign_contacts/core/data/datasources/remote/group_remote_datasource.dart';
import 'package:zorro_sign_contacts/core/data/datasources/remote/impl/contact_remote_datasource_impl.dart';
import 'package:zorro_sign_contacts/core/data/datasources/remote/impl/group_remote_datasource_impl.dart';

Future<void>? setup(GetIt di) async {
  // CONTACT REMOTE DATASOURCE
  di.registerLazySingleton<ContactRemoteDataSource>(() =>
      ContactRemoteDataSrouceImpl(
          client: di(), environmentalStore: di(), logger: di()));

  // GROUP REMOTE DATASOURCE
  di.registerLazySingleton<GroupRemoteDataSource>(() =>
      GroupRemoteDataSrouceImpl(
          client: di(), environmentalStore: di(), logger: di()));
}
