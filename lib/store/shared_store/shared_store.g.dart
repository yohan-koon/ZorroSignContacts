// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SharedStore on _SharedStore, Store {
  late final _$isRequestToReloadContactsAtom =
      Atom(name: '_SharedStore.isRequestToReloadContacts', context: context);

  @override
  bool? get isRequestToReloadContacts {
    _$isRequestToReloadContactsAtom.reportRead();
    return super.isRequestToReloadContacts;
  }

  @override
  set isRequestToReloadContacts(bool? value) {
    _$isRequestToReloadContactsAtom
        .reportWrite(value, super.isRequestToReloadContacts, () {
      super.isRequestToReloadContacts = value;
    });
  }

  late final _$isRequestToReloadGroupsAtom =
      Atom(name: '_SharedStore.isRequestToReloadGroups', context: context);

  @override
  bool? get isRequestToReloadGroups {
    _$isRequestToReloadGroupsAtom.reportRead();
    return super.isRequestToReloadGroups;
  }

  @override
  set isRequestToReloadGroups(bool? value) {
    _$isRequestToReloadGroupsAtom
        .reportWrite(value, super.isRequestToReloadGroups, () {
      super.isRequestToReloadGroups = value;
    });
  }

  late final _$_SharedStoreActionController =
      ActionController(name: '_SharedStore', context: context);

  @override
  void setIsRequestToReloadContacts(bool value) {
    final _$actionInfo = _$_SharedStoreActionController.startAction(
        name: '_SharedStore.setIsRequestToReloadContacts');
    try {
      return super.setIsRequestToReloadContacts(value);
    } finally {
      _$_SharedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsRequestToReloadGroups(bool value) {
    final _$actionInfo = _$_SharedStoreActionController.startAction(
        name: '_SharedStore.setIsRequestToReloadGroups');
    try {
      return super.setIsRequestToReloadGroups(value);
    } finally {
      _$_SharedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isRequestToReloadContacts: ${isRequestToReloadContacts},
isRequestToReloadGroups: ${isRequestToReloadGroups}
    ''';
  }
}
