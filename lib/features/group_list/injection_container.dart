import 'package:get_it/get_it.dart';
import 'package:zorro_sign_contacts/features/group_list/presentation/mobx/group_list_store.dart';

Future<void>? setup(GetIt di) async {
  di.registerFactory(() => GroupListStore(getGroupsUseCase: di(), sharedStore: di()));
}
