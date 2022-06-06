import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/features/landing/domain/enums/landing_bottom_tab.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';

class BottomNavBar extends StatelessWidget {
  final Function(LandingBottomTab) onTapTab;
  final LandingBottomTab selectedTab;
  const BottomNavBar(
      {Key? key, required this.onTapTab, required this.selectedTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Palette.GREY.withOpacity(0.2),
              blurRadius: 1.0,
              spreadRadius: 0,
              offset: const Offset(-3, -3))
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: selectedTab == LandingBottomTab.CONTACT ? 0 : 1,
        onTap: (int index) => index == 0
            ? onTapTab(LandingBottomTab.CONTACT)
            : onTapTab(LandingBottomTab.GROUP),
        selectedFontSize: 14.sp,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: context.i18n.bottomNavBarContact,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: context.i18n.bottomNavBarGroup,
          ),
        ],
      ),
    ));
  }
}
