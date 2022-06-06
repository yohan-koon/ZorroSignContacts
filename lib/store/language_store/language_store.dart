import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';
import 'package:zorro_sign_contacts/core/domain/enums/language.dart';

part 'language_store.g.dart';

class LanguageStore = _LanguageStore with _$LanguageStore;

abstract class _LanguageStore with Store {
  @observable
  Locale? defaultLanguage = const Locale('en');

  @observable
  int? defaultLanguageId;

  Future<void> setDefaultLanguage(
      BuildContext context, Language language) async {
    switch (language) {
      case Language.ENGLISH:
        defaultLanguage = const Locale('en');
        defaultLanguageId = 1;
        break;
      case Language.SINHALA:
        defaultLanguage = const Locale('si');
        defaultLanguageId = 2;
        break;
      case Language.TAMIL:
        defaultLanguage = const Locale('ta');
        defaultLanguageId = 3;
        break;
    }
    await FlutterI18n.refresh(context, defaultLanguage);
  }

   Future<void>? resetLanguageStore(BuildContext context) async{
    setDefaultLanguage(context, Language.ENGLISH);
  }
}
