// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_form_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GroupFormErrorState on _GroupFormErrorState, Store {
  late final _$groupNameAtom =
      Atom(name: '_GroupFormErrorState.groupName', context: context);

  @override
  String? get groupName {
    _$groupNameAtom.reportRead();
    return super.groupName;
  }

  @override
  set groupName(String? value) {
    _$groupNameAtom.reportWrite(value, super.groupName, () {
      super.groupName = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_GroupFormErrorState.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  @override
  String toString() {
    return '''
groupName: ${groupName},
description: ${description}
    ''';
  }
}
