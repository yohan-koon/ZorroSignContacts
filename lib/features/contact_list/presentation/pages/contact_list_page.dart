import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/components/contact_item/contact_item.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_bar.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_debouncer.dart';
import 'package:zorro_sign_contacts/core/components/seperator/seperator.dart';
import 'package:zorro_sign_contacts/features/contact_list/presentation/mobx/contact_list_store.dart';
import 'package:zorro_sign_contacts/features/contact_list/presentation/widgets/contacts_tab_bar/contacts_tab_bar.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/injection_container.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage>
    with SingleTickerProviderStateMixin {
  final ContactListStore _store = di();
  TextEditingController? _searchBarController;
  TabController? _tabController;
  final searchDebouncer = SearchDebouncer(milliseconds: 500);
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _searchBarController = TextEditingController();
    _tabController = TabController(length: 4, vsync: this);
    _tabController?.addListener(() {
      _store.setSelectedContactTypeTab(_tabController?.index);
    });
    _store.init(context);
    initReactions(context);
    super.initState();
  }

  @override
  void dispose() {
    _searchBarController?.dispose();
    _tabController?.dispose();
    for (var disposer in _disposers) {
      disposer();
    }
    _store.destroy(context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        _renderSearchBar(context),
        _renderContactsTabBar(context),
        Expanded(
            child: Stack(
          children: [_renderContactList(context)],
        ))
      ]),
    );
  }

  Widget _renderSearchBar(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SearchBar(
          hintText: context.i18n.contactListSearchBarPlaceholder,
          setValue: (String? value) => _store.setSearchBar(value),
          searchDebouncer: searchDebouncer,
          onSearch: (String? value) => _store.onSearch(value),
          controller: _searchBarController,
          value: _store.searchBar,
          isLoading: _store.isLoadingContacts,
        ),
      );
    });
  }

  Widget _renderContactsTabBar(BuildContext context) {
    return Observer(builder: (_) {
      return ContactsTabBar(
        tabController: _tabController,
        isLoading: _store.isLoadingContacts,
      );
    });
  }

  Widget _renderContactList(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        color: Palette.LIGHT_GREY,
        padding: EdgeInsets.all(4.w),
        child: _store.isLoadingContacts == true
            ? _renderShimmerList(context)
            : _renderList(context),
      );
    });
  }

  Widget _renderList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Seperator(
        height: 4.w,
      ),
      itemCount: _store.contacts?.length ?? 0,
      itemBuilder: (context, index) {
        print('index : ${index}');
        return ContactItem(
          data: _store.contacts?[index],
          onTapItem: (data) => print('on Tap Item'),
        );
      },
    );
  }

  Widget _renderShimmerList(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Seperator(
        height: 4.w,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        print('index : ${index}');
        return ContactItem(
          isLoading: _store.isLoadingContacts,
          data: null,
        );
      },
    );
  }

  /// *************************************************************************
  /// REACTIONS - START
  ///**************************************************************************/

  void initReactions(BuildContext context) {
    _bindForcefullLoadingContactList(context);
  }

  void _bindForcefullLoadingContactList(BuildContext context) {
    _disposers.add(
        reaction((_) => _store.sharedStore.isRequestToReloadContacts, (value) {
      value == true ? _store.loadContacts(context) : null;
    }));
  }

  /// *************************************************************************
  /// REACTIONS - END
  ///**************************************************************************/
}
