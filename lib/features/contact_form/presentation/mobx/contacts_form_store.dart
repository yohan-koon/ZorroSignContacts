import 'dart:convert';

import 'package:finap_validator/finap_validator.dart';
import 'package:finap_validator/validation_configs/email_validation_config.dart';
import 'package:finap_validator/validation_configs/required_validation_config.dart';
import 'package:finap_validator/validation_field.dart';
import 'package:finap_validator/validation_result.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/no.params.dart';
import 'package:zorro_sign_contacts/core/components/default_drop_down/default_drop_down_data.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector_helper.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_groups/get_groups.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.dart';
import 'package:zorro_sign_contacts/features/contact_form/domain/usecases/create_contact/create_contact.params.dart';
import 'package:zorro_sign_contacts/features/contact_form/presentation/mobx/contacts_form_error_state.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';

part 'contacts_form_store.g.dart';

class ContactsFormStore = _ContactsFormStore with _$ContactsFormStore;

abstract class _ContactsFormStore with Store {
  final Validator validator;
  final CreateContactUseCase createContactUseCase;
  final GetGroupsUseCase getGroupsUseCase;
  final List<ReactionDisposer> _disposers = [];

  _ContactsFormStore(
      {required this.validator,
      required this.createContactUseCase,
      required this.getGroupsUseCase});

  /// *************************************************************************
  /// LIFECYCLE EVENTS - START
  ///**************************************************************************/

  @action
  void init(BuildContext context) {
    _setFirstNameValidator(context);
    _setLastNameValidator(context);
    _setEmailAddressValidator(context);
    loadGroups(context);
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

  final ContactsFormErrorState errors = ContactsFormErrorState();

  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? emailAddress;

  @observable
  String? displayName;

  @observable
  String? jobTitle;

  @observable
  String? phoneNumber;

  @observable
  DropdownItemData? selectedGroup;

  @observable
  String? profileSource;

  @action
  void setFirstName(String? text) {
    firstName = text;
  }

  @action
  void setLastName(String? text) {
    lastName = text;
  }

  @action
  void setEmailAddress(String? text) {
    emailAddress = text;
  }

  @action
  void setDisplayName(String? text) {
    displayName = text;
  }

  @action
  void setJobTitle(String? text) {
    jobTitle = text;
  }

  @action
  void setPhoneNumber(String? text) {
    phoneNumber = text;
  }

  @action
  void setSelectedDropDownData(DropdownItemData? data) {
    selectedGroup = data;
  }

  @action
  void setProfileSource(String? source) {
    profileSource = source;
  }

  ValidationField _firstNameRequiredValidationField(
      BuildContext context, String? newValue) {
    return ValidationField(
        fieldName: context.i18n.contactFormFieldFirstName,
        value: newValue,
        validationConfigList: [
          RequiredValidationConfig(
              customErrorMessage:
                  '${context.i18n.contactFormFieldFirstName} ${context.i18n.validationIsRequired}'),
        ]);
  }

  void _setFirstNameValidator(
    BuildContext context,
  ) {
    _disposers.add(reaction((_) => firstName, (String? newValue) {
      if (firstName != null) {
        var validationList = <ValidationField>[
          _firstNameRequiredValidationField(context, newValue),
        ];
        var result = validator.validateFields(validationList);
        errors.firstName = !result.isValid ? result.message : '';
      } else {
        errors.firstName = '';
      }
    }));
  }

  ValidationField _lastNameRequiredValidationField(
      BuildContext context, String? newValue) {
    return ValidationField(
        fieldName: context.i18n.contactFormFieldLastName,
        value: newValue,
        validationConfigList: [
          RequiredValidationConfig(
              customErrorMessage:
                  '${context.i18n.contactFormFieldLastName} ${context.i18n.validationIsRequired}'),
        ]);
  }

  void _setLastNameValidator(
    BuildContext context,
  ) {
    _disposers.add(reaction((_) => lastName, (String? newValue) {
      if (lastName != null) {
        var validationList = <ValidationField>[
          _lastNameRequiredValidationField(context, newValue),
        ];
        var result = validator.validateFields(validationList);
        errors.lastName = !result.isValid ? result.message : '';
      } else {
        errors.lastName = '';
      }
    }));
  }

  ValidationField _emailRequiredValidationField(
      BuildContext context, String? newValue) {
    return ValidationField(
        fieldName: context.i18n.contactFormFieldEmailAddress,
        value: newValue,
        validationConfigList: [
          RequiredValidationConfig(
              customErrorMessage:
                  '${context.i18n.contactFormFieldEmailAddress} ${context.i18n.validationIsRequired}'),
          EmailValidationConfig(
              customErrorMessage:
                  '${context.i18n.contactFormFieldEmailAddress} ${context.i18n.validationEmailNotValid}')
        ]);
  }

  void _setEmailAddressValidator(
    BuildContext context,
  ) {
    _disposers.add(reaction((_) => emailAddress, (String? newValue) {
      if (emailAddress != null) {
        var validationList = <ValidationField>[
          _emailRequiredValidationField(context, newValue)
        ];
        var result = validator.validateFields(validationList);
        errors.emailAddress = !result.isValid ? result.message : '';
      } else {
        errors.emailAddress = '';
      }
    }));
  }

  ValidationResult _validateForm(BuildContext context) {
    var validationList = <ValidationField>[
      _firstNameRequiredValidationField(context, firstName),
      _lastNameRequiredValidationField(context, lastName),
      _emailRequiredValidationField(context, emailAddress),
    ];
    return validator.validateFields(validationList);
  }

  /// *************************************************************************
  /// FORM HANDLING - END
  ///**************************************************************************/

  /// *************************************************************************
  /// FETCH GROUPS - START
  ///**************************************************************************/

  @observable
  List<Group>? groups = [];

  @observable
  List<DropdownItemData>? groupsDropDownItems = [];

  @observable
  bool? isLoadingGroups = false;

  @observable
  String? groupsLoadingError;

  @action
  void setLoadGroupsStates(bool? isLoading, String? error, List<Group>? data) {
    isLoadingGroups = isLoading;
    groupsLoadingError = error;
    if (data != null && data.isNotEmpty == true) {
      groups = data;
      groupsDropDownItems = data
          .map((e) => DropdownItemData(
              name: e.groupName ?? '', id: e.id, data: jsonEncode(e.toJson())))
          .toList();
      selectedGroup = groupsDropDownItems?[0];
    }
  }

  @action
  Future<void> loadGroups(BuildContext context) async {
    try {
      setLoadGroupsStates(true, null, []);
      final response = await getGroupsUseCase(NoParams());
      response.fold((l) => setLoadGroupsStates(false, l.errorMessage, []),
          (r) => setLoadGroupsStates(false, null, r));
    } on Exception catch (error) {
      setLoadGroupsStates(false, error.toString(), []);
    }
  }

  /// *************************************************************************
  /// FETCH GROUPS - END
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
  /// SUBMIT FORM - START
  ///**************************************************************************/

  @observable
  bool? isLoadingFormSubmission;

  @observable
  String? formSubmissionError;

  @observable
  Contact? formSubmissionSuccessData;

  @action
  void setFormSubmissionStates(bool? isLoading, String? error, Contact? data) {
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
      final data = Contact(
          id: 0,
          firstName: firstName,
          lastName: lastName,
          email: emailAddress,
          displayName: displayName,
          jobTitle: jobTitle,
          phoneNumber: phoneNumber,
          groupId: selectedGroup?.id,
          groupName: selectedGroup?.name,
          imageStr: profileSource);
      final response =
          await createContactUseCase(CreateContactUsecaseParams(data: data));
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

  /// *************************************************************************
  /// NAVIGATION - END
  ///**************************************************************************/
}
