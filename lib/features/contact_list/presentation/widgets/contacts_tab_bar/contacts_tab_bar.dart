import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zorro_sign_contacts/features/contact_list/presentation/widgets/contacts_tab_bar/contacts_tab_bar.shimmer.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';

class ContactsTabBar extends StatelessWidget {
  final TabController? tabController;
  final bool? isLoading;
  const ContactsTabBar({Key? key, required this.tabController, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading == true ? _renderShimmer() : _renderTabBar(context);
  }

  Widget _renderTabBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: [
        Tab(
          text: context.i18n.contactListTabBarAll,
        ),
        Tab(
          text: context.i18n.contactListTabBarMyCompany,
        ),
        Tab(
          text: context.i18n.contactListTabBarPersonal,
        ),
        Tab(
          text: context.i18n.contactListTabBarInactive,
        ),
      ],
    );
  }

  Widget _renderShimmer() {
    return Shimmer.fromColors(
        baseColor: Palette.WHISPER,
        highlightColor: Palette.LIGHT_GREY,
        enabled: isLoading == true,
        child: ContactsTabBarShimmer());
  }
}
