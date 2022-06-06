// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_participants_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddParticipantsStore on _AddParticipantsStore, Store {
  late final _$searchBarAtom =
      Atom(name: '_AddParticipantsStore.searchBar', context: context);

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

  late final _$contactsAtom =
      Atom(name: '_AddParticipantsStore.contacts', context: context);

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
      Atom(name: '_AddParticipantsStore.isLoadingContacts', context: context);

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

  late final _$contactsLoadingErrorAtom = Atom(
      name: '_AddParticipantsStore.contactsLoadingError', context: context);

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

  late final _$participantsAtom =
      Atom(name: '_AddParticipantsStore.participants', context: context);

  @override
  ObservableList<Contact>? get participants {
    _$participantsAtom.reportRead();
    return super.participants;
  }

  @override
  set participants(ObservableList<Contact>? value) {
    _$participantsAtom.reportWrite(value, super.participants, () {
      super.participants = value;
    });
  }

  late final _$loadContactsAsyncAction =
      AsyncAction('_AddParticipantsStore.loadContacts', context: context);

  @override
  Future<void> loadContacts(BuildContext context) {
    return _$loadContactsAsyncAction.run(() => super.loadContacts(context));
  }

  late final _$_AddParticipantsStoreActionController =
      ActionController(name: '_AddParticipantsStore', context: context);

  @override
  void init(BuildContext context, List<Contact>? list) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.init');
    try {
      return super.init(context, list);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void destroy(BuildContext context) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.destroy');
    try {
      return super.destroy(context);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar(String? value) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.setSearchBar');
    try {
      return super.setSearchBar(value);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSearch(String? value) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadContactsStates(
      bool? isLoading, String? error, List<Contact>? data) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.setLoadContactsStates');
    try {
      return super.setLoadContactsStates(isLoading, error, data);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParticipants(List<Contact>? list) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.setParticipants');
    try {
      return super.setParticipants(list);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapContactItem(Contact? data) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.onTapContactItem');
    try {
      return super.onTapContactItem(data);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isCheckBoxSelected(BuildContext context, Contact? data) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.isCheckBoxSelected');
    try {
      return super.isCheckBoxSelected(context, data);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeParticipant(BuildContext context, Contact? data) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.removeParticipant');
    try {
      return super.removeParticipant(context, data);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToNext(BuildContext context) {
    final _$actionInfo = _$_AddParticipantsStoreActionController.startAction(
        name: '_AddParticipantsStore.navigateToNext');
    try {
      return super.navigateToNext(context);
    } finally {
      _$_AddParticipantsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
contacts: ${contacts},
isLoadingContacts: ${isLoadingContacts},
contactsLoadingError: ${contactsLoadingError},
participants: ${participants}
    ''';
  }
}
