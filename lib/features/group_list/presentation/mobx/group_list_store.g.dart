// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupListStore on _GroupListStore, Store {
  late final _$searchBarAtom =
      Atom(name: '_GroupListStore.searchBar', context: context);

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

  late final _$groupsAtom =
      Atom(name: '_GroupListStore.groups', context: context);

  @override
  List<Group>? get groups {
    _$groupsAtom.reportRead();
    return super.groups;
  }

  @override
  set groups(List<Group>? value) {
    _$groupsAtom.reportWrite(value, super.groups, () {
      super.groups = value;
    });
  }

  late final _$isLoadingGroupsAtom =
      Atom(name: '_GroupListStore.isLoadingGroups', context: context);

  @override
  bool? get isLoadingGroups {
    _$isLoadingGroupsAtom.reportRead();
    return super.isLoadingGroups;
  }

  @override
  set isLoadingGroups(bool? value) {
    _$isLoadingGroupsAtom.reportWrite(value, super.isLoadingGroups, () {
      super.isLoadingGroups = value;
    });
  }

  late final _$groupsLoadingErrorAtom =
      Atom(name: '_GroupListStore.groupsLoadingError', context: context);

  @override
  String? get groupsLoadingError {
    _$groupsLoadingErrorAtom.reportRead();
    return super.groupsLoadingError;
  }

  @override
  set groupsLoadingError(String? value) {
    _$groupsLoadingErrorAtom.reportWrite(value, super.groupsLoadingError, () {
      super.groupsLoadingError = value;
    });
  }

  late final _$loadGroupsAsyncAction =
      AsyncAction('_GroupListStore.loadGroups', context: context);

  @override
  Future<void> loadGroups(BuildContext context) {
    return _$loadGroupsAsyncAction.run(() => super.loadGroups(context));
  }

  late final _$_GroupListStoreActionController =
      ActionController(name: '_GroupListStore', context: context);

  @override
  void init(BuildContext context) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.init');
    try {
      return super.init(context);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void destroy(BuildContext context) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.destroy');
    try {
      return super.destroy(context);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchBar(String? value) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.setSearchBar');
    try {
      return super.setSearchBar(value);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSearch(String? value) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadGroupsStates(bool? isLoading, String? error, List<Group>? data) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.setLoadGroupsStates');
    try {
      return super.setLoadGroupsStates(isLoading, error, data);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToGroupForm(BuildContext context, Group? group) {
    final _$actionInfo = _$_GroupListStoreActionController.startAction(
        name: '_GroupListStore.navigateToGroupForm');
    try {
      return super.navigateToGroupForm(context, group);
    } finally {
      _$_GroupListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchBar: ${searchBar},
groups: ${groups},
isLoadingGroups: ${isLoadingGroups},
groupsLoadingError: ${groupsLoadingError}
    ''';
  }
}
