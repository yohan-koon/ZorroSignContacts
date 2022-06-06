import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/config/features/domain/usecases/no.params.dart';
import 'package:zorro_sign_contacts/core/domain/common_usecases/get_groups/get_groups.dart';
import 'package:zorro_sign_contacts/core/domain/entities/group.dart';
import 'package:zorro_sign_contacts/routes/router.gr.dart';
import 'package:zorro_sign_contacts/store/shared_store/shared_store.dart';

part 'group_list_store.g.dart';

class GroupListStore = _GroupListStore with _$GroupListStore;

abstract class _GroupListStore with Store {
  final GetGroupsUseCase getGroupsUseCase;
  final SharedStore sharedStore;
  _GroupListStore({required this.getGroupsUseCase, required this.sharedStore});

  /// *************************************************************************
  /// LIFECYCLE EVENTS - START
  ///**************************************************************************/

  @action
  void init(BuildContext context) {
    loadGroups(context);
  }

  @action
  void destroy(BuildContext context) {}

  /// *************************************************************************
  /// LIFECYCLE EVENTS - END
  ///**************************************************************************/

  /// *************************************************************************
  /// SEARCH BAR FORM HANDLING - START
  ///**************************************************************************/

  @observable
  String? searchBar = '';

  @action
  void setSearchBar(String? value) {
    print('Request to Set Value ${value}');
    searchBar = value ?? '';
  }

  @action
  void onSearch(String? value) {
    print('Request to Search ${value}');
  }

  /// *************************************************************************
  /// SEARCH BAR FORM HANDLING - END
  ///**************************************************************************/

  /// *************************************************************************
  /// FETCH GROUPS - START
  ///**************************************************************************/

  @observable
  List<Group>? groups = [];

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
      if (sharedStore.isRequestToReloadGroups == true) {
        sharedStore.setIsRequestToReloadGroups(false);
      }
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
  /// NAVIGATION - START
  ///**************************************************************************/

  @action
  void navigateToGroupForm(BuildContext context, Group? group) {
    context.router.push(GroupFormPageRoute(group: group));
  }

  /// *************************************************************************
  /// NAVIGATION - END
  ///**************************************************************************/
}
