// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../core/domain/entities/contact.dart' as _i8;
import '../core/domain/entities/group.dart' as _i7;
import '../features/add_participants/presentation/pages/add_participants_page.dart'
    as _i4;
import '../features/contact_form/presentation/pages/contact_form_page.dart'
    as _i3;
import '../features/group_form/presentation/pages/group_form_page.dart' as _i2;
import '../features/landing/presentation/pages/landing_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LandingPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    GroupFormPageRoute.name: (routeData) {
      final args = routeData.argsAs<GroupFormPageRouteArgs>(
          orElse: () => const GroupFormPageRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.GroupFormPage(key: args.key, group: args.group));
    },
    ContactFormPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ContactFormPage());
    },
    AddParticipantsPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddParticipantsPageRouteArgs>(
          orElse: () => const AddParticipantsPageRouteArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.AddParticipantsPage(
              key: args.key, participants: args.participants));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LandingPageRoute.name, path: '/'),
        _i5.RouteConfig(GroupFormPageRoute.name, path: '/group-form-page'),
        _i5.RouteConfig(ContactFormPageRoute.name, path: '/contact-form-page'),
        _i5.RouteConfig(AddParticipantsPageRoute.name,
            path: '/add-participants-page')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingPageRoute extends _i5.PageRouteInfo<void> {
  const LandingPageRoute() : super(LandingPageRoute.name, path: '/');

  static const String name = 'LandingPageRoute';
}

/// generated route for
/// [_i2.GroupFormPage]
class GroupFormPageRoute extends _i5.PageRouteInfo<GroupFormPageRouteArgs> {
  GroupFormPageRoute({_i6.Key? key, _i7.Group? group})
      : super(GroupFormPageRoute.name,
            path: '/group-form-page',
            args: GroupFormPageRouteArgs(key: key, group: group));

  static const String name = 'GroupFormPageRoute';
}

class GroupFormPageRouteArgs {
  const GroupFormPageRouteArgs({this.key, this.group});

  final _i6.Key? key;

  final _i7.Group? group;

  @override
  String toString() {
    return 'GroupFormPageRouteArgs{key: $key, group: $group}';
  }
}

/// generated route for
/// [_i3.ContactFormPage]
class ContactFormPageRoute extends _i5.PageRouteInfo<void> {
  const ContactFormPageRoute()
      : super(ContactFormPageRoute.name, path: '/contact-form-page');

  static const String name = 'ContactFormPageRoute';
}

/// generated route for
/// [_i4.AddParticipantsPage]
class AddParticipantsPageRoute
    extends _i5.PageRouteInfo<AddParticipantsPageRouteArgs> {
  AddParticipantsPageRoute({_i6.Key? key, List<_i8.Contact>? participants})
      : super(AddParticipantsPageRoute.name,
            path: '/add-participants-page',
            args: AddParticipantsPageRouteArgs(
                key: key, participants: participants));

  static const String name = 'AddParticipantsPageRoute';
}

class AddParticipantsPageRouteArgs {
  const AddParticipantsPageRouteArgs({this.key, this.participants});

  final _i6.Key? key;

  final List<_i8.Contact>? participants;

  @override
  String toString() {
    return 'AddParticipantsPageRouteArgs{key: $key, participants: $participants}';
  }
}
