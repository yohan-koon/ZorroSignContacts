import 'package:mobx/mobx.dart';

part 'contacts_form_error_state.g.dart';

class ContactsFormErrorState = _ContactsFormErrorState
    with _$ContactsFormErrorState;

abstract class _ContactsFormErrorState with Store {
  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? emailAddress;

  @observable
  String? displayName;

  @observable
  String? jobTitle;

  @observable
  String? phoneNumber;

  @observable
  String? group;
}
