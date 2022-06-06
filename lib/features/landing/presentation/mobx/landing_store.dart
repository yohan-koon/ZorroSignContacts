import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/features/landing/domain/enums/landing_bottom_tab.dart';
import 'package:auto_route/auto_route.dart';
import 'package:zorro_sign_contacts/routes/router.gr.dart';
import 'package:zorro_sign_contacts/store/shared_store/shared_store.dart';

part 'landing_store.g.dart';

class LandingStore = _LandingStore with _$LandingStore;

abstract class _LandingStore with Store {
  final SharedStore sharedStore;

  _LandingStore({required this.sharedStore});

  /// *************************************************************************
  /// HANDLE LANDING BOTTOM TABS - START
  ///**************************************************************************/

  @observable
  LandingBottomTab selectedLandingBottomTab = LandingBottomTab.CONTACT;

  @action
  void setSelectedLandingBottomTab(LandingBottomTab tab) {
    selectedLandingBottomTab = tab;
  }

  /// *************************************************************************
  /// HANDLE LANDING BOTTOM TABS - START
  ///**************************************************************************/

  /// *************************************************************************
  /// HANDLE NAVIGATION - START
  ///**************************************************************************/

  @action
  void navigateToCreateContact(BuildContext context) {
    context.router
        .push(const ContactFormPageRoute())
        .then((value) => sharedStore.setIsRequestToReloadContacts(true));
  }

  @action
  void navigateToCreateGroup(BuildContext context) {
    context.router.push(GroupFormPageRoute()).then((value) {
      sharedStore.setIsRequestToReloadGroups(true);
    });
  }

  /// *************************************************************************
  /// HANDLE NAVIGATION - END
  ///**************************************************************************/
}
