import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.params.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.params.dart';

abstract class GroupRemoteDataSource {
  Future<List<Group>?> getGroups();
  Future<Group?> getGroupById(GetGroupUsecaseParams params);
  Future<Group?> insert(CreateGroupUsecaseParams params);
  Future<Group?> udpate(UpdateGroupUsecaseParams params);
}
