import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/no.params.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_contacts/get_contacts.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/store/shared_store/shared_store.dart';

part 'contact_list_store.g.dart';

class ContactListStore = _ContactListStore with _$ContactListStore;

abstract class _ContactListStore with Store {
  final GetContactsUseCase getContactsUseCase;
  final SharedStore sharedStore;

  _ContactListStore(
      {required this.getContactsUseCase, required this.sharedStore});

  /// *************************************************************************
  /// LIFECYCLE EVENTS - START
  ///**************************************************************************/

  @action
  void init(BuildContext context) {
    loadContacts(context);
  }

  @action
  void destroy(BuildContext context) {}

  /// *************************************************************************
  /// LIFECYCLE EVENTS - END
  ///**************************************************************************/

  /// *************************************************************************
  /// SEARCH BAR FORM HANDLING - START
  ///**************************************************************************/

  @observable
  String? searchBar = '';

  @action
  void setSearchBar(String? value) {
    print('Request to Set Value ${value}');
    searchBar = value ?? '';
  }

  @action
  void onSearch(String? value) {
    print('Request to Search ${value}');
  }

  /// *************************************************************************
  /// SEARCH BAR FORM HANDLING - END
  ///**************************************************************************/

  /// *************************************************************************
  /// CONTACT TYPE TAB BAR HANDLING - START
  ///**************************************************************************/

  @observable
  int? selectedContactTypeTab = 0;

  @action
  void setSelectedContactTypeTab(int? index) {
    if (selectedContactTypeTab != index) {
      selectedContactTypeTab = index ?? 0;
    }
  }

  /// *************************************************************************
  /// CONTACT TYPE TAB BAR HANDLING - START
  ///**************************************************************************/

  /// *************************************************************************
  /// FETCH CONTACTS - START
  ///**************************************************************************/

  @observable
  List<Contact>? contacts = [];

  @observable
  bool? isLoadingContacts = false;

  @observable
  String? contactsLoadingError;

  @action
  void setLoadContactsStates(
      bool? isLoading, String? error, List<Contact>? data) {
    isLoadingContacts = isLoading;
    contactsLoadingError = error;
    if (data != null && data.isNotEmpty == true) {
      contacts = data;
      if (sharedStore.isRequestToReloadContacts == true) {
        sharedStore.setIsRequestToReloadContacts(false);
      }
    }
  }

  @action
  Future<void> loadContacts(BuildContext context) async {
    try {
      setLoadContactsStates(true, null, []);
      final response = await getContactsUseCase(NoParams());
      response.fold((l) => setLoadContactsStates(false, l.errorMessage, []),
          (r) => setLoadContactsStates(false, null, r));
    } on Exception catch (error) {
      setLoadContactsStates(false, error.toString(), []);
    }
  }

  /// *************************************************************************
  /// FETCH CONTACTS - END
  ///**************************************************************************/
}
