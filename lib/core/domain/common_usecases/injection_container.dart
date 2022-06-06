import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_contacts/get_contacts.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_groups/get_groups.dart';

Future<void>? setup(GetIt di) async {
  //GET CONTACTS USECASE
  di.registerFactory(() => GetContactsUseCase(
      repository: di()));

  //GET GROUPS USECASE
  di.registerFactory(() => GetGroupsUseCase(
      repository: di()));

  //GET GROUP USECASE
  di.registerFactory(() => GetGroupUseCase(
      repository: di()));
}
