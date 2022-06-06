// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupFormStore on _GroupFormStore, Store {
  late final _$groupNameAtom =
      Atom(name: '_GroupFormStore.groupName', context: context);

  @override
  String? get groupName {
    _$groupNameAtom.reportRead();
    return super.groupName;
  }

  @override
  set groupName(String? value) {
    _$groupNameAtom.reportWrite(value, super.groupName, () {
      super.groupName = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_GroupFormStore.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$profileSourceAtom =
      Atom(name: '_GroupFormStore.profileSource', context: context);

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

  late final _$isVisibleImageCapturingSelectorAtom = Atom(
      name: '_GroupFormStore.isVisibleImageCapturingSelector',
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

  late final _$groupAtom =
      Atom(name: '_GroupFormStore.group', context: context);

  @override
  Group? get group {
    _$groupAtom.reportRead();
    return super.group;
  }

  @override
  set group(Group? value) {
    _$groupAtom.reportWrite(value, super.group, () {
      super.group = value;
    });
  }

  late final _$isLoadingGroupAtom =
      Atom(name: '_GroupFormStore.isLoadingGroup', context: context);

  @override
  bool? get isLoadingGroup {
    _$isLoadingGroupAtom.reportRead();
    return super.isLoadingGroup;
  }

  @override
  set isLoadingGroup(bool? value) {
    _$isLoadingGroupAtom.reportWrite(value, super.isLoadingGroup, () {
      super.isLoadingGroup = value;
    });
  }

  late final _$groupLoadingErrorAtom =
      Atom(name: '_GroupFormStore.groupLoadingError', context: context);

  @override
  String? get groupLoadingError {
    _$groupLoadingErrorAtom.reportRead();
    return super.groupLoadingError;
  }

  @override
  set groupLoadingError(String? value) {
    _$groupLoadingErrorAtom.reportWrite(value, super.groupLoadingError, () {
      super.groupLoadingError = value;
    });
  }

  late final _$participantsAtom =
      Atom(name: '_GroupFormStore.participants', context: context);

  @override
  List<Contact>? get participants {
    _$participantsAtom.reportRead();
    return super.participants;
  }

  @override
  set participants(List<Contact>? value) {
    _$participantsAtom.reportWrite(value, super.participants, () {
      super.participants = value;
    });
  }

  late final _$isLoadingFormSubmissionAtom =
      Atom(name: '_GroupFormStore.isLoadingFormSubmission', context: context);

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
      Atom(name: '_GroupFormStore.formSubmissionError', context: context);

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

  late final _$formSubmissionSuccessDataAtom =
      Atom(name: '_GroupFormStore.formSubmissionSuccessData', context: context);

  @override
  Group? get formSubmissionSuccessData {
    _$formSubmissionSuccessDataAtom.reportRead();
    return super.formSubmissionSuccessData;
  }

  @override
  set formSubmissionSuccessData(Group? value) {
    _$formSubmissionSuccessDataAtom
        .reportWrite(value, super.formSubmissionSuccessData, () {
      super.formSubmissionSuccessData = value;
    });
  }

  late final _$onImageCapturingTypeSelectedAsyncAction = AsyncAction(
      '_GroupFormStore.onImageCapturingTypeSelected',
      context: context);

  @override
  Future<void> onImageCapturingTypeSelected(
      BuildContext context, ImageCapturingType type) {
    return _$onImageCapturingTypeSelectedAsyncAction
        .run(() => super.onImageCapturingTypeSelected(context, type));
  }

  late final _$loadGroupAsyncAction =
      AsyncAction('_GroupFormStore.loadGroup', context: context);

  @override
  Future<void> loadGroup(BuildContext context, int? id) {
    return _$loadGroupAsyncAction.run(() => super.loadGroup(context, id));
  }

  late final _$onSubmitAsyncAction =
      AsyncAction('_GroupFormStore.onSubmit', context: context);

  @override
  Future<void> onSubmit(BuildContext context) {
    return _$onSubmitAsyncAction.run(() => super.onSubmit(context));
  }

  late final _$_GroupFormStoreActionController =
      ActionController(name: '_GroupFormStore', context: context);

  @override
  void init(BuildContext context, Group? group) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.init');
    try {
      return super.init(context, group);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void destroy(BuildContext context) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.destroy');
    try {
      return super.destroy(context);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGroupName(String? text) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setGroupName');
    try {
      return super.setGroupName(text);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String? text) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setDescription');
    try {
      return super.setDescription(text);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfileSource(String? source) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setProfileSource');
    try {
      return super.setProfileSource(source);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsVisibleImageCapturingSelector(bool value) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setIsVisibleImageCapturingSelector');
    try {
      return super.setIsVisibleImageCapturingSelector(value);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRequestToUploadImage(BuildContext context) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.onRequestToUploadImage');
    try {
      return super.onRequestToUploadImage(context);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadGroupStates(bool? isLoading, String? error, Group? data) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setLoadGroupStates');
    try {
      return super.setLoadGroupStates(isLoading, error, data);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setParticipants(List<Contact>? value) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setParticipants');
    try {
      return super.setParticipants(value);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFormSubmissionStates(bool? isLoading, String? error, Group? data) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.setFormSubmissionStates');
    try {
      return super.setFormSubmissionStates(isLoading, error, data);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetFormSubmissionStates(BuildContext context) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.resetFormSubmissionStates');
    try {
      return super.resetFormSubmissionStates(context);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToPreviousPage(BuildContext context) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.navigateToPreviousPage');
    try {
      return super.navigateToPreviousPage(context);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void navigateToAddParticipantsPage(BuildContext context) {
    final _$actionInfo = _$_GroupFormStoreActionController.startAction(
        name: '_GroupFormStore.navigateToAddParticipantsPage');
    try {
      return super.navigateToAddParticipantsPage(context);
    } finally {
      _$_GroupFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groupName: ${groupName},
description: ${description},
profileSource: ${profileSource},
isVisibleImageCapturingSelector: ${isVisibleImageCapturingSelector},
group: ${group},
isLoadingGroup: ${isLoadingGroup},
groupLoadingError: ${groupLoadingError},
participants: ${participants},
isLoadingFormSubmission: ${isLoadingFormSubmission},
formSubmissionError: ${formSubmissionError},
formSubmissionSuccessData: ${formSubmissionSuccessData}
    ''';
  }
}
