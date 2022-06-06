import 'package:finap_base_theme/palette.dart';
import 'package:finap_base_theme/theme_variation_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/components/bar_button/bar_button.dart';
import 'package:zorro_sign_contacts/core/components/bar_button/bar_button_type.dart';
import 'package:zorro_sign_contacts/core/components/base_app_bar/base_app_bar.dart';
import 'package:zorro_sign_contacts/core/components/contact_item/contact_item.dart';
import 'package:zorro_sign_contacts/core/components/default_drop_down/default_drop_down.dart';
import 'package:zorro_sign_contacts/core/components/default_text_field/default_text_field.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector_helper.dart';
import 'package:zorro_sign_contacts/core/components/message/message_helper.dart';
import 'package:zorro_sign_contacts/core/domain/entities/contact.dart';
import 'package:zorro_sign_contacts/features/contact_form/presentation/mobx/contacts_form_store.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/injection_container.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({Key? key}) : super(key: key);

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final ContactsFormStore _store = di();
  final ImageCapturingSourceSelectorHelper _imageCapturingSourceSelectorHelper =
      di();
  final MessageHelper messageHelper = di();

  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _store.init(context);
    initReactions(context);
    super.initState();
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
    _store.destroy(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: context.i18n.contactFormTitle,
        elevation: 1,
      ),
      body: _renderBody(context),
      bottomNavigationBar: _renderSubmitBtn(context),
    );
  }

  Widget _renderBody(BuildContext context) {
    return Container(
      color: Palette.LIGHT_GREY,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Observer(builder: (_) {
              return ContactItem(
                data: Contact(
                    imageStr: _store.profileSource,
                    displayName: _store.displayName != null &&
                            _store.displayName?.isNotEmpty == true
                        ? _store.displayName
                        : context.i18n.contactItemDisplayName,
                    email: _store.emailAddress != null &&
                            _store.emailAddress?.isNotEmpty == true
                        ? _store.emailAddress
                        : context.i18n.contactItemDisplayEmail),
                onTapAvatar: (data) => _store.onRequestToUploadImage(context),
              );
            }),
          ),
          Expanded(child: _renderForm(context))
        ],
      ),
    );
  }

  Widget _renderForm(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 4.w, top: 2.w),
      decoration: BoxDecoration(
          color: Palette.WHITE,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w))),
      child: SingleChildScrollView(
        child: Column(children: [
          _renderFirstNameField(context),
          _renderLastNameField(context),
          _renderEmailAddressField(context),
          _renderDisplayNameField(context),
          _renderJobTitleField(context),
          _renderPhoneNumberField(context),
          _renderGroupsField(context)
        ]),
      ),
    );
  }

  Widget _renderFirstNameField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        isMandatory: true,
        validationMessage: _store.errors.firstName,
        initialValue: _store.firstName,
        hintText: context.i18n.contactFormFieldFirstName,
        setValue: (String? text) => _store.setFirstName(text),
        isLoading: _store.isLoadingFormSubmission,
      );
    });
  }

  Widget _renderLastNameField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        isMandatory: true,
        validationMessage: _store.errors.lastName,
        initialValue: _store.lastName,
        hintText: context.i18n.contactFormFieldLastName,
        setValue: (String? text) => _store.setLastName(text),
        isLoading: _store.isLoadingFormSubmission,
      );
    });
  }

  Widget _renderEmailAddressField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        isMandatory: true,
        validationMessage: _store.errors.emailAddress,
        initialValue: _store.emailAddress,
        hintText: context.i18n.contactFormFieldEmailAddress,
        setValue: (String? text) => _store.setEmailAddress(text),
        isLoading: _store.isLoadingFormSubmission,
        keyboardType: TextInputType.emailAddress,
      );
    });
  }

  Widget _renderDisplayNameField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        validationMessage: _store.errors.displayName,
        initialValue: _store.displayName,
        hintText: context.i18n.contactFormFieldDisplayName,
        setValue: (String? text) => _store.setDisplayName(text),
        isLoading: _store.isLoadingFormSubmission,
      );
    });
  }

  Widget _renderJobTitleField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        validationMessage: _store.errors.jobTitle,
        initialValue: _store.jobTitle,
        hintText: context.i18n.contactFormFieldJobTitle,
        setValue: (String? text) => _store.setJobTitle(text),
        isLoading: _store.isLoadingFormSubmission,
      );
    });
  }

  Widget _renderPhoneNumberField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        validationMessage: _store.errors.phoneNumber,
        initialValue: _store.phoneNumber,
        hintText: context.i18n.contactFormFieldPhoneNumber,
        setValue: (String? text) => _store.setPhoneNumber(text),
        isLoading: _store.isLoadingFormSubmission,
        keyboardType: TextInputType.phone,
      );
    });
  }

  Widget _renderGroupsField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultDropDown(
        isMandatory: true,
        hintText: context.i18n.contactFormFieldGroup,
        setValue: (data) => _store.setSelectedDropDownData(data),
        dropdownItemDataList: _store.groupsDropDownItems,
        isLoading: _store.isLoadingGroups == true ||
            _store.isLoadingFormSubmission == true,
        validationMessage: _store.errors.group,
        dropdownItemData: _store.selectedGroup,
      );
    });
  }

  Widget _renderSubmitBtn(BuildContext context) {
    return SafeArea(
        child: Container(
            height: 22.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.w),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Observer(builder: (_) {
                    return BarButton(
                      buttonType: BarButtonType.FILLED,
                      title: context.i18n.commonSave,
                      height: 40,
                      textStyle: Theme.of(context).primaryTextTheme.headline5,
                      onTap: () => _store.onSubmit(context),
                      cornerRadius: 2.w,
                      isLoading: _store.isLoadingFormSubmission,
                    );
                  }),
                ))
              ],
            )));
  }

  /// *************************************************************************
  /// REACTIONS - START
  ///**************************************************************************/

  void initReactions(BuildContext context) {
    _bindImageCapturingSelectorReaction(context);
    _bindFormSubmissionError(context);
    _bindFormSubmissionSuccess(context);
  }

  void _bindImageCapturingSelectorReaction(BuildContext context) {
    _disposers
        .add(reaction((_) => _store.isVisibleImageCapturingSelector, (loading) {
      loading == true
          ? _imageCapturingSourceSelectorHelper.show(
              context: context,
              isDismissible: true,
              isDraggable: true,
              onItemSelected: (ImageCapturingType type) {
                _store.onImageCapturingTypeSelected(context, type);
              },
              onDismissed: () =>
                  _store.setIsVisibleImageCapturingSelector(false))
          : null;
    }));
  }

  void _bindFormSubmissionError(BuildContext context) {
    _disposers.add(reaction((_) => _store.formSubmissionError, (String? error) {
      error != null
          ? messageHelper.show(
              message: '${_store.formSubmissionError}',
              context: context,
              isDismissible: false,
              isDraggable: false,
              themeVariationType: ThemeVariationType.error,
              onTapSubmitCallback: () =>
                  _store.resetFormSubmissionStates(context))
          : null;
    }));
  }

  void _bindFormSubmissionSuccess(BuildContext context) {
    _disposers.add(
        reaction((_) => _store.formSubmissionSuccessData, (Contact? error) {
      error != null
          ? messageHelper.show(
              message: context.i18n.contactFormSubmissionSuccess,
              context: context,
              isDismissible: false,
              isDraggable: false,
              themeVariationType: ThemeVariationType.success,
              onTapSubmitCallback: () {
                _store.resetFormSubmissionStates(context);
                _store.navigateToPreviousPage(context);
              })
          : null;
    }));
  }

  /// *************************************************************************
  /// REACTIONS - END
  ///**************************************************************************/
}
