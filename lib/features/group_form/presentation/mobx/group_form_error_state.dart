import 'package:mobx/mobx.dart';

part 'group_form_error_state.g.dart';

class GroupFormErrorState = _GroupFormErrorState
    with _$GroupFormErrorState;

abstract class _GroupFormErrorState with Store {
  @observable
  String? groupName;

  @observable
  String? description;
}
