import 'package:zorro_sign_contacts/flavour_config.dart';
import 'package:mobx/mobx.dart';

part 'shared_store.g.dart';

class SharedStore = _SharedStore with _$SharedStore;

abstract class _SharedStore with Store {
  @observable
  bool? isRequestToReloadContacts;

  @observable
  bool? isRequestToReloadGroups;

  @action
  void setIsRequestToReloadContacts(bool value) {
    isRequestToReloadContacts = value;
  }

  @action
  void setIsRequestToReloadGroups(bool value) {
    isRequestToReloadGroups = value;
  }
}
