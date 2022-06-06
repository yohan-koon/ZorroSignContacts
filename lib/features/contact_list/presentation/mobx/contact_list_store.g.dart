// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactListStore on _ContactListStore, Store {
  late final _$searchBarAtom =
      Atom(name: '_ContactListStore.searchBar', context: context);

  @override
  String? get searchBar {
    _$searchBarAtom.reportRead();
    return super.searchBar;
  }

  @override
  set searchBar(String? value) {
    _$searchBarAtom.reportWrite(value, super.searchBar, () {
      super.searchBar = value;
    });
  }

  late final _$selectedContactTypeTabAtom =
      Atom(name: '_ContactListStore.selectedContactTypeTab', context: context);

  @override
  int? get selectedContactTypeTab {
    _$selectedContactTypeTabAtom.reportRead();
    return super.selectedContactTypeTab;
  }

  @override
  set selectedContactTypeTab(int? value) {
    _$selectedContactTypeTabAtom
        .reportWrite(value, super.selectedContactTypeTab, () {
      super.selectedContactTypeTab = value;
    });
  }

  late final _$contactsAtom =
      Atom(name: '_ContactListStore.contacts', context: context);

  @override
  List<Contact>? get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<Contact>? value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$isLoadingContactsAtom =
      Atom(name: '_ContactListStore.isLoadingContacts', context: context);

  @override
  bool? get isLoadingContacts {
    _$isLoadingContactsAtom.reportRead();
    return super.isLoadingContacts;
  }

  @override
  set isLoadingContacts(bool? value) {
    _$isLoadingContactsAtom.reportWrite(value, super.isLoadingContacts, () {
      super.isLoadingContacts = value;
    });
  }

  late final _$contactsLoadingErrorAtom =
      Atom(name: '_ContactListStore.contactsLoadingError', context: context);

  @override
  String? get contactsLoadingError {
    _$contactsLoadingErrorAtom.reportRead();
    return super.contactsLoadingError;
  }

  @override
  set contactsLoadingError(String? value) {
    _$contactsLoadingErrorAtom.reportWrite(value, super.contactsLoadingError,
        () {
      super.contactsLoadingError = value;
    });
  }

  late final _$loadContactsAsyncAction =
      AsyncAction('_ContactListStore.loadContacts', context: context);

  @override
  Future<void> loadContacts(BuildContext context) {
    return _$loadContactsAsyncAction.run(() => super.loadContacts(context));
  }

  late final _$_ContactListStoreActionController =
      ActionController(name: '_ContactListStore', context: context);

  @override
  void init(BuildContext context) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.init');
    try {
      return super.init(context);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void destroy(BuildContext context) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.destroy');
    try {
      return super.destroy(context);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar(String? value) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.setSearchBar');
    try {
      return super.setSearchBar(value);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSearch(String? value) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedContactTypeTab(int? index) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.setSelectedContactTypeTab');
    try {
      return super.setSelectedContactTypeTab(index);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadContactsStates(
      bool? isLoading, String? error, List<Contact>? data) {
    final _$actionInfo = _$_ContactListStoreActionController.startAction(
        name: '_ContactListStore.setLoadContactsStates');
    try {
      return super.setLoadContactsStates(isLoading, error, data);
    } finally {
      _$_ContactListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
selectedContactTypeTab: ${selectedContactTypeTab},
contacts: ${contacts},
isLoadingContacts: ${isLoadingContacts},
contactsLoadingError: ${contactsLoadingError}
    ''';
  }
}
