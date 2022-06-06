import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:finap_validator/finap_validator.dart';
import 'package:finap_validator/validation_configs/required_validation_config.dart';
import 'package:finap_validator/validation_field.dart';
import 'package:finap_validator/validation_result.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector_helper.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_group/get_group.params.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/create_group/create_group.params.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.dart';
import 'package:zorro_sign_contacts/features/group_form/domain/usecases/update_group/update_group.params.dart';
import 'package:zorro_sign_contacts/features/group_form/presentation/mobx/group_form_error_state.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/routes/router.gr.dart';

part 'group_form_store.g.dart';

class GroupFormStore = _GroupFormStore with _$GroupFormStore;

abstract class _GroupFormStore with Store {
  final Validator validator;
  final CreateGroupUseCase createGroupUseCase;
  final UpdateGroupUseCase updateGroupUseCase;
  final GetGroupUseCase getGroupUseCase;

  final List<ReactionDisposer> _disposers = [];

  _GroupFormStore(
      {required this.validator,
      required this.createGroupUseCase,
      required this.updateGroupUseCase,
      required this.getGroupUseCase});

  /// *************************************************************************
  /// LIFECYCLE EVENTS - START
  ///**************************************************************************/

  @action
  void init(BuildContext context, Group? group) {
    _setGroupNameValidator(context);
    if (group != null) {
      setGroupName(group.groupName);
      setDescription(group.description);
      setProfileSource(group.imageStr);
      loadGroup(context, group.id);
    }
  }

  @action
  void destroy(BuildContext context) {
    for (var disposer in _disposers) {
      disposer();
    }
  }

  /// *************************************************************************
  /// LIFECYCLE EVENTS - END
  ///**************************************************************************/

  /// *************************************************************************
  /// FORM HANDLING - START
  ///**************************************************************************/

  final GroupFormErrorState errors = GroupFormErrorState();

  @observable
  String? groupName;

  @observable
  String? description;

  @observable
  String? profileSource;

  @action
  void setGroupName(String? text) {
    groupName = text;
  }

  @action
  void setDescription(String? text) {
    description = text;
  }

  @action
  void setProfileSource(String? source) {
    profileSource = source;
  }

  ValidationField _groupNameRequiredValidationField(
      BuildContext context, String? newValue) {
    return ValidationField(
        fieldName: context.i18n.groupFormFieldGroupName,
        value: newValue,
        validationConfigList: [
          RequiredValidationConfig(
              customErrorMessage:
                  '${context.i18n.groupFormFieldGroupName} ${context.i18n.validationIsRequired}'),
        ]);
  }

  void _setGroupNameValidator(
    BuildContext context,
  ) {
    _disposers.add(reaction((_) => groupName, (String? newValue) {
      if (groupName != null) {
        var validationList = <ValidationField>[
          _groupNameRequiredValidationField(context, newValue),
        ];
        var result = validator.validateFields(validationList);
        errors.groupName = !result.isValid ? result.message : '';
      } else {
        errors.groupName = '';
      }
    }));
  }

  ValidationResult _validateForm(BuildContext context) {
    var validationList = <ValidationField>[
      _groupNameRequiredValidationField(context, groupName),
    ];
    return validator.validateFields(validationList);
  }

  /// *************************************************************************
  /// FORM HANDLING - END
  ///**************************************************************************/

  /// *************************************************************************
  /// IMAGE HANDLING - START
  ///**************************************************************************/

  @observable
  bool? isVisibleImageCapturingSelector = false;

  @action
  void setIsVisibleImageCapturingSelector(bool value) {
    isVisibleImageCapturingSelector = value;
  }

  @action
  void onRequestToUploadImage(BuildContext context) {
    isVisibleImageCapturingSelector = true;
  }

  @action
  Future<void> onImageCapturingTypeSelected(
      BuildContext context, ImageCapturingType type) async {
    final ImagePicker imagePicker = ImagePicker();
    switch (type) {
      case ImageCapturingType.CAMERA:
        _showPhotoLibrary(context, imagePicker, ImageSource.camera);
        break;
      case ImageCapturingType.PHOTO_LIBRARY:
        _showPhotoLibrary(context, imagePicker, ImageSource.gallery);
        break;
    }
  }

  Future<void> _showPhotoLibrary(
      BuildContext context, ImagePicker imagePicker, ImageSource source) async {
    try {
      final file = await imagePicker.pickImage(source: source);
      final bytes = await file?.readAsBytes();
      if (bytes != null) {
        String img64 = base64Encode(bytes);
        setProfileSource(img64);
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  /// *************************************************************************
  /// IMAGE HANDLING - END
  ///**************************************************************************/

  /// *************************************************************************
  /// FETCH GROUP - START
  ///**************************************************************************/

  @observable
  Group? group;

  @observable
  bool? isLoadingGroup = false;

  @observable
  String? groupLoadingError;

  @action
  void setLoadGroupStates(bool? isLoading, String? error, Group? data) {
    isLoadingGroup = isLoading;
    groupLoadingError = error;
    if (data != null) {
      group = data;
      participants = data.participants;
    }
  }

  @action
  Future<void> loadGroup(BuildContext context, int? id) async {
    try {
      setLoadGroupStates(true, null, null);
      final response = await getGroupUseCase(GetGroupUsecaseParams(id: id));
      response.fold((l) => setLoadGroupStates(false, l.errorMessage, null),
          (r) => setLoadGroupStates(false, null, r));
    } on Exception catch (error) {
      setLoadGroupStates(false, error.toString(), null);
    }
  }

  /// *************************************************************************
  /// FETCH GROUP - END
  ///**************************************************************************/

  /// *************************************************************************
  /// PARTICIPANTS HANDLING - START
  ///**************************************************************************/

  @observable
  List<Contact>? participants;

  @action
  void setParticipants(List<Contact>? value) {
    participants = value;
  }

  /// *************************************************************************
  /// PARTICIPANTS HANDLING - END
  ///**************************************************************************/

  /// *************************************************************************
  /// SUBMIT FORM - START
  ///**************************************************************************/

  @observable
  bool? isLoadingFormSubmission;

  @observable
  String? formSubmissionError;

  @observable
  Group? formSubmissionSuccessData;

  @action
  void setFormSubmissionStates(bool? isLoading, String? error, Group? data) {
    isLoadingFormSubmission = isLoading;
    formSubmissionError = error;
    formSubmissionSuccessData = data;
  }

  @action
  Future<void> onSubmit(BuildContext context) async {
    try {
      setFormSubmissionStates(true, null, null);
      var result = _validateForm(context);
      if (!result.isValid) {
        setFormSubmissionStates(false, result.message, null);
      }
      final data = Group(
          id: group != null && group?.id != null ? group?.id : 0,
          groupName: groupName,
          description: description,
          imageStr: profileSource,
          participants: participants);
      final response = group != null && group?.id != null
          ? await updateGroupUseCase(UpdateGroupUsecaseParams(data: data))
          : await createGroupUseCase(CreateGroupUsecaseParams(data: data));
      response.fold((l) => setFormSubmissionStates(false, l.errorMessage, null),
          (r) => setFormSubmissionStates(false, null, r));
    } on Exception catch (error) {
      setFormSubmissionStates(false, error.toString(), null);
    }
  }

  @action
  void resetFormSubmissionStates(BuildContext context) {
    setFormSubmissionStates(false, null, null);
  }

  /// *************************************************************************
  /// SUBMIT FORM - END
  ///**************************************************************************/

  /// *************************************************************************/
  /// NAVIGATION - START
  ///**************************************************************************

  @action
  void navigateToPreviousPage(BuildContext context) {
    Navigator.pop(context, true);
  }

  @action
  void navigateToAddParticipantsPage(BuildContext context) {
    context.router
        .push(AddParticipantsPageRoute(participants: participants))
        .then((value) {
      if (value != null) {
        var result = value as List<Contact>?;
        setParticipants(result?.map((e) => e).toList());
      }
    });
  }

  /// *************************************************************************
  /// NAVIGATION - END
  ///**************************************************************************/
}
