import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.dart';

import 'presentation/mobx/group_form_store.dart';

Future<void>? setup(GetIt di) async {
  // CONTACT FORM STORE
  di.registerFactory(() => GroupFormStore(validator: di(), createGroupUseCase: di(), updateGroupUseCase: di(), getGroupUseCase: di()));

  //CREATE CONTACT USECASE
  di.registerFactory(() => CreateGroupUseCase(
      repository: di()));

  //UDPATE CONTACT USECASE
  di.registerFactory(() => UpdateGroupUseCase(
      repository: di()));
}
