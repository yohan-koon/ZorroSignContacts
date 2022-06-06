import 'package:finap_base_theme/palette.dart';
import 'package:finap_base_theme/theme_variation_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/base64/base64_data.dart';
import 'package:zorro_sign_contacts/core/components/avatar/avatar.dart';
import 'package:zorro_sign_contacts/core/components/bar_button/bar_button.dart';
import 'package:zorro_sign_contacts/core/components/bar_button/bar_button_type.dart';
import 'package:zorro_sign_contacts/core/components/base_app_bar/base_app_bar.dart';
import 'package:zorro_sign_contacts/core/components/circular_button/circular_button.dart';
import 'package:zorro_sign_contacts/core/components/default_text_field/default_text_field.dart';
import 'package:zorro_sign_contacts/core/components/image_capturing_source_selector/image_capturing_source_selector_helper.dart';
import 'package:zorro_sign_contacts/core/components/message/message_helper.dart';
import 'package:zorro_sign_contacts/core/components/participants/participants.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/features/group_form/presentation/mobx/group_form_store.dart';
import 'package:zorro_sign_contacts/helpers/base64_utils/base64_utils.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/injection_container.dart';

class GroupFormPage extends StatefulWidget {
  final Group? group;
  const GroupFormPage({Key? key, this.group}) : super(key: key);

  @override
  State<GroupFormPage> createState() => _GroupFormPageState();
}

class _GroupFormPageState extends State<GroupFormPage> {
  final GroupFormStore _store = di();
  final ImageCapturingSourceSelectorHelper _imageCapturingSourceSelectorHelper =
      di();
  final MessageHelper messageHelper = di();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _store.init(context, widget.group);
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
      backgroundColor: Palette.WHITE,
      appBar: BaseAppBar(
        title: context.i18n.groupFormTitle,
        elevation: 1,
      ),
      body: _renderBody(context),
      bottomNavigationBar: _renderSubmitBtn(context),
    );
  }

  Widget _renderBody(BuildContext context) {
    return Container(
      color: Palette.WHITE,
      child: Column(
        children: [
          _renderAvatar(context),
          Expanded(child: _renderForm(context)),
        ],
      ),
    );
  }

  Widget _renderAvatar(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(top: 8.w),
        child: Avatar(
          size: 25.w,
          source: Base64Utils.convertBase64Image(
              _store.profileSource ?? Base64Data.DEFAULT_CAMERA),
          onTap: () => _store.onRequestToUploadImage(context),
        ),
      );
    });
  }

  Widget _renderForm(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 4.w, top: 2.w),
      child: SingleChildScrollView(
        child: Column(children: [
          _renderGroupNameField(context),
          _renderDescriptionField(context),
          _renderParticipants(context),
        ]),
      ),
    );
  }

  Widget _renderGroupNameField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        isMandatory: true,
        validationMessage: _store.errors.groupName,
        initialValue: _store.groupName,
        hintText: context.i18n.groupFormFieldGroupName,
        setValue: (String? text) => _store.setGroupName(text),
        isLoading: _store.isLoadingFormSubmission,
      );
    });
  }

  Widget _renderDescriptionField(BuildContext context) {
    return Observer(builder: (_) {
      return DefaultTextField(
        isMandatory: true,
        validationMessage: _store.errors.description,
        initialValue: _store.description,
        hintText: context.i18n.groupFormFieldDescription,
        setValue: (String? text) => _store.setDescription(text),
        isLoading: _store.isLoadingFormSubmission,
        maxLines: 5,
      );
    });
  }

  Widget _renderParticipants(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.i18n.groupFormParticipants,
            style: Theme.of(context).primaryTextTheme.headline5?.copyWith(),
          ),
          SizedBox(
            height: 4.w,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: Observer(builder: (_) {
              return Participants(
                participants: _store.participants,
                isLoading: _store.isLoadingFormSubmission == true ||
                    _store.isLoadingGroup == true,
              );
            })),
            Observer(builder: (_) {
              return CircularButton(
                size: (76 / 5).w,
                iconData: Icons.add,
                onTap: () => _store.navigateToAddParticipantsPage(context),
                isLoading: _store.isLoadingFormSubmission == true ||
                    _store.isLoadingGroup == true,
              );
            })
          ])
        ],
      ),
    );
    ;
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
                      title: widget.group != null
                          ? context.i18n.commonSave
                          : context.i18n.commonCreate,
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
    _disposers
        .add(reaction((_) => _store.formSubmissionSuccessData, (Group? error) {
      error != null
          ? messageHelper.show(
              message: context.i18n.groupFormSubmissionSuccess,
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
