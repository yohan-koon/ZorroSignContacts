import 'package:finap_base_theme/base_theme_config.dart';
import 'package:zorro_sign_contacts/injection_container.dart';
import 'package:zorro_sign_contacts/theme/theme_type.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/theme_config.dart'
    as zorro_contacts_theme_config;
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  BaseThemeConfig tc = di<zorro_contacts_theme_config.ThemeConfig>();

  @action
  void setThemeConfig(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.zorroContacts:
        tc = di<zorro_contacts_theme_config.ThemeConfig>();
        break;
    }
  }
}
