import 'package:finap_base_theme/base_colors.dart';
import 'package:finap_base_theme/base_components_theme_data.dart';
import 'package:finap_base_theme/base_dimensions.dart';
import 'package:finap_base_theme/base_font_sizes.dart';
import 'package:finap_base_theme/base_fonts.dart';
import 'package:finap_base_theme/base_text_themes.dart';
import 'package:finap_base_theme/base_theme_config.dart';
import 'package:flutter/material.dart';
import 'package:zorro_sign_contacts/injection_container.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/colors.dart'
    as theme_colors;
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/dimensions.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/font_sizes.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/fonts.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/text_themes.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/components_theme_data.dart';

class ThemeConfig extends BaseThemeConfig {
  @override
  BaseColors colors = di<theme_colors.Colors>();

  @override
  BaseFonts fonts = di<Fonts>();

  @override
  BaseFontSizes fontSizes = di<FontSizes>();

  @override
  BaseTextThemes textThemes = di<TextThemes>();

  @override
  BaseComponentsThemeData componentsThemeData = di<ComponentsThemeData>();

  @override
  BaseDimensions dimensions = di<Dimensions>();

  @override
  ThemeData theme(Locale? locale) {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: colors.primaryColor,
        primarySwatch: colors.primarySwatch,
        appBarTheme: componentsThemeData.appBarTheme,
        fontFamily: getFontFamily(locale),
        textTheme: textThemes.textTheme,
        primaryTextTheme: textThemes.primaryTextTheme,
        typography: textThemes.typography,
        bottomNavigationBarTheme: componentsThemeData.bottomNavigationBarTheme,
        tabBarTheme: componentsThemeData.tabBarTheme,
        floatingActionButtonTheme:
            componentsThemeData.floatingActionButtonTheme);
  }

  String getFontFamily(Locale? locale) {
    switch (locale?.languageCode) {
      case 'en':
        return fonts.primaryFontFamily;
      case 'si':
        return fonts.secondaryFontFamily;
      case 'ta':
        return fonts.secondaryFontFamily;
      default:
        return fonts.primaryFontFamily;
    }
  }
}
