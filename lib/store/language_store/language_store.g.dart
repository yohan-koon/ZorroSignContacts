// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageStore on _LanguageStore, Store {
  late final _$defaultLanguageAtom =
      Atom(name: '_LanguageStore.defaultLanguage', context: context);

  @override
  Locale? get defaultLanguage {
    _$defaultLanguageAtom.reportRead();
    return super.defaultLanguage;
  }

  @override
  set defaultLanguage(Locale? value) {
    _$defaultLanguageAtom.reportWrite(value, super.defaultLanguage, () {
      super.defaultLanguage = value;
    });
  }

  late final _$defaultLanguageIdAtom =
      Atom(name: '_LanguageStore.defaultLanguageId', context: context);

  @override
  int? get defaultLanguageId {
    _$defaultLanguageIdAtom.reportRead();
    return super.defaultLanguageId;
  }

  @override
  set defaultLanguageId(int? value) {
    _$defaultLanguageIdAtom.reportWrite(value, super.defaultLanguageId, () {
      super.defaultLanguageId = value;
    });
  }

  @override
  String toString() {
    return '''
defaultLanguage: ${defaultLanguage},
defaultLanguageId: ${defaultLanguageId}
    ''';
  }
}
