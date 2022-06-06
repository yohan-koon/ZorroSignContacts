import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/no.params.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_contacts/get_contacts.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/store/shared_store/shared_store.dart';

part 'add_participants_store.g.dart';

class AddParticipantsStore = _AddParticipantsStore with _$AddParticipantsStore;

abstract class _AddParticipantsStore with Store {
  final GetContactsUseCase getContactsUseCase;
  final SharedStore sharedStore;

  _AddParticipantsStore(
      {required this.getContactsUseCase, required this.sharedStore});

  /// *************************************************************************
  /// LIFECYCLE EVENTS - START
  ///**************************************************************************/

  @action
  void init(BuildContext context, List<Contact>? list) {
    loadContacts(context);
    setParticipants(list ?? []);
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

  /// *************************************************************************
  /// HANDLE PARTICIPANTS - START
  ///**************************************************************************/

  @observable
  ObservableList<Contact>? participants = ObservableList<Contact>();

  @action
  void setParticipants(List<Contact>? list) {
    list?.forEach((element) {
      participants?.add(element);
    });
  }

  @action
  void onTapContactItem(Contact? data) {
    final Contact? result = participants?.firstWhere(
        (element) => data?.id == element.id,
        orElse: () => Contact(id: null));
    if (result != null && result.id != null) {
      participants?.removeWhere((element) => data?.id == element.id);
    } else {
      if(data != null){
        participants?.add(data);
      }
      
    }
    contacts = [...?contacts];
  }

  @action
  bool isCheckBoxSelected(BuildContext context, Contact? data) {
    final Contact? result = participants?.firstWhere(
        (element) => element.id == data?.id,
        orElse: () => Contact(id: null));
    return result != null && result.id != null ? true : false;
  }

  @action
  void removeParticipant(BuildContext context, Contact? data){
    if (data != null && data.id != null) {
      participants?.removeWhere((element) => data.id == element.id);
      contacts = [...?contacts];
    } 
  }

  /// *************************************************************************
  /// HANDLE PARTICIPANTS - END
  ///**************************************************************************/

  /// *************************************************************************
  /// NAVIGATION - START
  ///**************************************************************************/

  @action
  void navigateToNext(BuildContext context) {
    final response = participants?.map((element) => element).toList();
    Navigator.pop(context, response);
  }

  /// *************************************************************************
  /// NAVIGATION - END
  ///**************************************************************************/
}
