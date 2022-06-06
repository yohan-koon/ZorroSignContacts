import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:zorro_sign_contacts/core/components/group_item/group_item.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_bar.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_debouncer.dart';
import 'package:zorro_sign_contacts/core/components/seperator/seperator.dart';
import 'package:zorro_sign_contacts/features/group_list/presentation/mobx/group_list_store.dart';
import 'package:zorro_sign_contacts/helpers/localized_build_context/localized_build_context.dart';
import 'package:zorro_sign_contacts/injection_container.dart';

class GroupListPage extends StatefulWidget {
  const GroupListPage({Key? key}) : super(key: key);

  @override
  State<GroupListPage> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage>
    with SingleTickerProviderStateMixin {
  final GroupListStore _store = di();
  TextEditingController? _searchBarController;
  final searchDebouncer = SearchDebouncer(milliseconds: 500);
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    _searchBarController = TextEditingController();
    _store.init(context);
    initReactions(context);
    super.initState();
  }

  @override
  void dispose() {
    _searchBarController?.dispose();
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
        Expanded(
            child: Stack(
          children: [_renderGroupList(context)],
        ))
      ]),
    );
  }

  Widget _renderSearchBar(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w, bottom: 4.w),
        child: SearchBar(
          hintText: context.i18n.groupListSearchBarPlaceholder,
          setValue: (String? value) => _store.setSearchBar(value),
          searchDebouncer: searchDebouncer,
          onSearch: (String? value) => _store.onSearch(value),
          controller: _searchBarController,
          value: _store.searchBar,
          isLoading: _store.isLoadingGroups,
        ),
      );
    });
  }

  Widget _renderGroupList(BuildContext context) {
    return Observer(builder: (_) {
      return Container(
        color: Palette.LIGHT_GREY,
        padding: EdgeInsets.all(4.w),
        child: _store.isLoadingGroups == true
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
      itemCount: _store.groups?.length ?? 0,
      itemBuilder: (context, index) {
        print(index);
        return GroupItem(
            data: _store.groups?[index],
            onTapItem: (item) => _store.navigateToGroupForm(context, item));
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
        return GroupItem(
          isLoading: _store.isLoadingGroups,
          data: null,
        );
      },
    );
  }

  /// *************************************************************************
  /// REACTIONS - START
  ///**************************************************************************/

  void initReactions(BuildContext context) {
    _bindForcefullLoadingGroupList(context);
  }

  void _bindForcefullLoadingGroupList(BuildContext context) {
    _disposers.add(
        reaction((_) => _store.sharedStore.isRequestToReloadGroups, (value) {
      value == true ? _store.loadGroups(context) : null;
    }));
  }

  /// *************************************************************************
  /// REACTIONS - END
  ///**************************************************************************/
}
