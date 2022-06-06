// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landing_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LandingStore on _LandingStore, Store {
  late final _$selectedLandingBottomTabAtom =
      Atom(name: '_LandingStore.selectedLandingBottomTab', context: context);

  @override
  LandingBottomTab get selectedLandingBottomTab {
    _$selectedLandingBottomTabAtom.reportRead();
    return super.selectedLandingBottomTab;
  }

  @override
  set selectedLandingBottomTab(LandingBottomTab value) {
    _$selectedLandingBottomTabAtom
        .reportWrite(value, super.selectedLandingBottomTab, () {
      super.selectedLandingBottomTab = value;
    });
  }

  late final _$_LandingStoreActionController =
      ActionController(name: '_LandingStore', context: context);

  @override
  void setSelectedLandingBottomTab(LandingBottomTab tab) {
    final _$actionInfo = _$_LandingStoreActionController.startAction(
        name: '_LandingStore.setSelectedLandingBottomTab');
    try {
      return super.setSelectedLandingBottomTab(tab);
    } finally {
      _$_LandingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToCreateContact(BuildContext context) {
    final _$actionInfo = _$_LandingStoreActionController.startAction(
        name: '_LandingStore.navigateToCreateContact');
    try {
      return super.navigateToCreateContact(context);
    } finally {
      _$_LandingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToCreateGroup(BuildContext context) {
    final _$actionInfo = _$_LandingStoreActionController.startAction(
        name: '_LandingStore.navigateToCreateGroup');
    try {
      return super.navigateToCreateGroup(context);
    } finally {
      _$_LandingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedLandingBottomTab: ${selectedLandingBottomTab}
    ''';
  }
}
