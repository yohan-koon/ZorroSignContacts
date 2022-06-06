import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:zorro_sign_contacts/core/components/base_app_bar/base_app_bar.dart';
import 'package:zorro_sign_contacts/features/contact_list/presentation/pages/contact_list_page.dart';
import 'package:zorro_sign_contacts/features/group_list/presentation/pages/group_list_page.dart';
import 'package:zorro_sign_contacts/features/landing/domain/enums/landing_bottom_tab.dart';
import 'package:zorro_sign_contacts/features/landing/presentation/mobx/landing_store.dart';
import 'package:zorro_sign_contacts/features/landing/presentation/widgets/bottom_nav_bar.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/injection_container.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LandingStore _store = di();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.WHITE,
      appBar: renderBaseAppBar(context),
      body: _renderBody(context),
      bottomNavigationBar: _renderBottomNavBar(context),
      floatingActionButton: _renderCreateButtons(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  PreferredSizeWidget renderBaseAppBar(BuildContext context) {
    return BaseAppBar(
      titleWidget: Observer(builder: (_) {
        return Text(
            _store.selectedLandingBottomTab == LandingBottomTab.CONTACT
                ? context.i18n.contactListTitle
                : context.i18n.groupListTitle,
            style: Theme.of(context).primaryTextTheme.headline5?.copyWith(
                color: Palette.BLACK,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal));
      }),
      trailingImage: _renderTrailingIcon(context),
      onPressTrailing: () => {},
      elevation: 0,
      isHandleBackNavigation: false,
    );
  }

  Widget _renderTrailingIcon(BuildContext context) {
    return Observer(
        builder: (_) =>
            _store.selectedLandingBottomTab == LandingBottomTab.CONTACT
                ? const Icon(Icons.save_alt)
                : const Icon(Icons.download));
  }

  Widget _renderBody(BuildContext context) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.max, children: [_renderPages(context)]),
    );
  }

  Widget _renderPages(BuildContext context) {
    return Observer(builder: (_) {
      return _store.selectedLandingBottomTab == LandingBottomTab.CONTACT
          ? const ContactsListPage()
          : const GroupListPage();
    });
  }

  Widget _renderBottomNavBar(BuildContext context) {
    return Observer(builder: (_) {
      return BottomNavBar(
        selectedTab: _store.selectedLandingBottomTab,
        onTapTab: (LandingBottomTab tab) =>
            _store.setSelectedLandingBottomTab(tab),
      );
    });
  }

  Widget _renderCreateButtons(BuildContext context) {
    return Observer(builder: (_) {
      return FloatingActionButton(
        onPressed: () =>
            _store.selectedLandingBottomTab == LandingBottomTab.CONTACT
                ? _store.navigateToCreateContact(context)
                : _store.navigateToCreateGroup(context),
        child: Icon(_store.selectedLandingBottomTab == LandingBottomTab.CONTACT
            ? Icons.person_add
            : Icons.group_add),
      );
    });
  }
}
