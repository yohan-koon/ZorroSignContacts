// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_form_error_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactsFormErrorState on _ContactsFormErrorState, Store {
  late final _$firstNameAtom =
      Atom(name: '_ContactsFormErrorState.firstName', context: context);

  @override
  String? get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String? value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_ContactsFormErrorState.lastName', context: context);

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$emailAddressAtom =
      Atom(name: '_ContactsFormErrorState.emailAddress', context: context);

  @override
  String? get emailAddress {
    _$emailAddressAtom.reportRead();
    return super.emailAddress;
  }

  @override
  set emailAddress(String? value) {
    _$emailAddressAtom.reportWrite(value, super.emailAddress, () {
      super.emailAddress = value;
    });
  }

  late final _$displayNameAtom =
      Atom(name: '_ContactsFormErrorState.displayName', context: context);

  @override
  String? get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String? value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$jobTitleAtom =
      Atom(name: '_ContactsFormErrorState.jobTitle', context: context);

  @override
  String? get jobTitle {
    _$jobTitleAtom.reportRead();
    return super.jobTitle;
  }

  @override
  set jobTitle(String? value) {
    _$jobTitleAtom.reportWrite(value, super.jobTitle, () {
      super.jobTitle = value;
    });
  }

  late final _$phoneNumberAtom =
      Atom(name: '_ContactsFormErrorState.phoneNumber', context: context);

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  late final _$groupAtom =
      Atom(name: '_ContactsFormErrorState.group', context: context);

  @override
  String? get group {
    _$groupAtom.reportRead();
    return super.group;
  }

  @override
  set group(String? value) {
    _$groupAtom.reportWrite(value, super.group, () {
      super.group = value;
    });
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
emailAddress: ${emailAddress},
displayName: ${displayName},
jobTitle: ${jobTitle},
phoneNumber: ${phoneNumber},
group: ${group}
    ''';
  }
}
