// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactsFormStore on _ContactsFormStore, Store {
  late final _$firstNameAtom =
      Atom(name: '_ContactsFormStore.firstName', context: context);

  @override
  String? get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String? value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_ContactsFormStore.lastName', context: context);

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$emailAddressAtom =
      Atom(name: '_ContactsFormStore.emailAddress', context: context);

  @override
  String? get emailAddress {
    _$emailAddressAtom.reportRead();
    return super.emailAddress;
  }

  @override
  set emailAddress(String? value) {
    _$emailAddressAtom.reportWrite(value, super.emailAddress, () {
      super.emailAddress = value;
    });
  }

  late final _$displayNameAtom =
      Atom(name: '_ContactsFormStore.displayName', context: context);

  @override
  String? get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String? value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$jobTitleAtom =
      Atom(name: '_ContactsFormStore.jobTitle', context: context);

  @override
  String? get jobTitle {
    _$jobTitleAtom.reportRead();
    return super.jobTitle;
  }

  @override
  set jobTitle(String? value) {
    _$jobTitleAtom.reportWrite(value, super.jobTitle, () {
      super.jobTitle = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_ContactsFormStore.phoneNumber', context: context);

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$selectedGroupAtom =
      Atom(name: '_ContactsFormStore.selectedGroup', context: context);

  @override
  DropdownItemData? get selectedGroup {
    _$selectedGroupAtom.reportRead();
    return super.selectedGroup;
  }

  @override
  set selectedGroup(DropdownItemData? value) {
    _$selectedGroupAtom.reportWrite(value, super.selectedGroup, () {
      super.selectedGroup = value;
    });
  }

  late final _$profileSourceAtom =
      Atom(name: '_ContactsFormStore.profileSource', context: context);

  @override
  String? get profileSource {
    _$profileSourceAtom.reportRead();
    return super.profileSource;
  }

  @override
  set profileSource(String? value) {
    _$profileSourceAtom.reportWrite(value, super.profileSource, () {
      super.profileSource = value;
    });
  }

  late final _$groupsAtom =
      Atom(name: '_ContactsFormStore.groups', context: context);

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

  late final _$groupsDropDownItemsAtom =
      Atom(name: '_ContactsFormStore.groupsDropDownItems', context: context);

  @override
  List<DropdownItemData>? get groupsDropDownItems {
    _$groupsDropDownItemsAtom.reportRead();
    return super.groupsDropDownItems;
  }

  @override
  set groupsDropDownItems(List<DropdownItemData>? value) {
    _$groupsDropDownItemsAtom.reportWrite(value, super.groupsDropDownItems, () {
      super.groupsDropDownItems = value;
    });
  }

  late final _$isLoadingGroupsAtom =
      Atom(name: '_ContactsFormStore.isLoadingGroups', context: context);

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
      Atom(name: '_ContactsFormStore.groupsLoadingError', context: context);

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

  late final _$isVisibleImageCapturingSelectorAtom = Atom(
      name: '_ContactsFormStore.isVisibleImageCapturingSelector',
      context: context);

  @override
  bool? get isVisibleImageCapturingSelector {
    _$isVisibleImageCapturingSelectorAtom.reportRead();
    return super.isVisibleImageCapturingSelector;
  }

  @override
  set isVisibleImageCapturingSelector(bool? value) {
    _$isVisibleImageCapturingSelectorAtom
        .reportWrite(value, super.isVisibleImageCapturingSelector, () {
      super.isVisibleImageCapturingSelector = value;
    });
  }

  late final _$isLoadingFormSubmissionAtom = Atom(
      name: '_ContactsFormStore.isLoadingFormSubmission', context: context);

  @override
  bool? get isLoadingFormSubmission {
    _$isLoadingFormSubmissionAtom.reportRead();
    return super.isLoadingFormSubmission;
  }

  @override
  set isLoadingFormSubmission(bool? value) {
    _$isLoadingFormSubmissionAtom
        .reportWrite(value, super.isLoadingFormSubmission, () {
      super.isLoadingFormSubmission = value;
    });
  }

  late final _$formSubmissionErrorAtom =
      Atom(name: '_ContactsFormStore.formSubmissionError', context: context);

  @override
  String? get formSubmissionError {
    _$formSubmissionErrorAtom.reportRead();
    return super.formSubmissionError;
  }

  @override
  set formSubmissionError(String? value) {
    _$formSubmissionErrorAtom.reportWrite(value, super.formSubmissionError, () {
      super.formSubmissionError = value;
    });
  }

  late final _$formSubmissionSuccessDataAtom = Atom(
      name: '_ContactsFormStore.formSubmissionSuccessData', context: context);

  @override
  Contact? get formSubmissionSuccessData {
    _$formSubmissionSuccessDataAtom.reportRead();
    return super.formSubmissionSuccessData;
  }

  @override
  set formSubmissionSuccessData(Contact? value) {
    _$formSubmissionSuccessDataAtom
        .reportWrite(value, super.formSubmissionSuccessData, () {
      super.formSubmissionSuccessData = value;
    });
  }

  late final _$loadGroupsAsyncAction =
      AsyncAction('_ContactsFormStore.loadGroups', context: context);

  @override
  Future<void> loadGroups(BuildContext context) {
    return _$loadGroupsAsyncAction.run(() => super.loadGroups(context));
  }

  late final _$onImageCapturingTypeSelectedAsyncAction = AsyncAction(
      '_ContactsFormStore.onImageCapturingTypeSelected',
      context: context);

  @override
  Future<void> onImageCapturingTypeSelected(
      BuildContext context, ImageCapturingType type) {
    return _$onImageCapturingTypeSelectedAsyncAction
        .run(() => super.onImageCapturingTypeSelected(context, type));
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_ContactsFormStore.onSubmit', context: context);

  @override
  Future<void> onSubmit(BuildContext context) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(context));
  }

  late final _$_ContactsFormStoreActionController =
      ActionController(name: '_ContactsFormStore', context: context);

  @override
  void init(BuildContext context) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.init');
    try {
      return super.init(context);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void destroy(BuildContext context) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.destroy');
    try {
      return super.destroy(context);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String? text) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setFirstName');
    try {
      return super.setFirstName(text);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String? text) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setLastName');
    try {
      return super.setLastName(text);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailAddress(String? text) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setEmailAddress');
    try {
      return super.setEmailAddress(text);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDisplayName(String? text) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setDisplayName');
    try {
      return super.setDisplayName(text);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJobTitle(String? text) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setJobTitle');
    try {
      return super.setJobTitle(text);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoneNumber(String? text) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setPhoneNumber');
    try {
      return super.setPhoneNumber(text);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDropDownData(DropdownItemData? data) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setSelectedDropDownData');
    try {
      return super.setSelectedDropDownData(data);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfileSource(String? source) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setProfileSource');
    try {
      return super.setProfileSource(source);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadGroupsStates(bool? isLoading, String? error, List<Group>? data) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setLoadGroupsStates');
    try {
      return super.setLoadGroupsStates(isLoading, error, data);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsVisibleImageCapturingSelector(bool value) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setIsVisibleImageCapturingSelector');
    try {
      return super.setIsVisibleImageCapturingSelector(value);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRequestToUploadImage(BuildContext context) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.onRequestToUploadImage');
    try {
      return super.onRequestToUploadImage(context);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFormSubmissionStates(bool? isLoading, String? error, Contact? data) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.setFormSubmissionStates');
    try {
      return super.setFormSubmissionStates(isLoading, error, data);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFormSubmissionStates(BuildContext context) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.resetFormSubmissionStates');
    try {
      return super.resetFormSubmissionStates(context);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToPreviousPage(BuildContext context) {
    final _$actionInfo = _$_ContactsFormStoreActionController.startAction(
        name: '_ContactsFormStore.navigateToPreviousPage');
    try {
      return super.navigateToPreviousPage(context);
    } finally {
      _$_ContactsFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
emailAddress: ${emailAddress},
displayName: ${displayName},
jobTitle: ${jobTitle},
phoneNumber: ${phoneNumber},
selectedGroup: ${selectedGroup},
profileSource: ${profileSource},
groups: ${groups},
groupsDropDownItems: ${groupsDropDownItems},
isLoadingGroups: ${isLoadingGroups},
groupsLoadingError: ${groupsLoadingError},
isVisibleImageCapturingSelector: ${isVisibleImageCapturingSelector},
isLoadingFormSubmission: ${isLoadingFormSubmission},
formSubmissionError: ${formSubmissionError},
formSubmissionSuccessData: ${formSubmissionSuccessData}
    ''';
  }
}
