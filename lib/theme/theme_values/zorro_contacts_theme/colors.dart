import 'package:finap_base_theme/base_colors.dart';
import 'package:finap_base_theme/palette.dart';
import 'package:finap_base_theme/theme_color_variation.dart';
import 'package:finap_extensions/color_extension.dart';
import 'package:flutter/material.dart';

class Colors extends BaseColors {
  @override
  ThemeColorVariation themeColorVariation = ThemeColorVariation(
      primary: Palette.GREEN,
      warning: Palette.RED,
      error: Palette.RED,
      success: Palette.GREEN, //Palette.green
      info: Palette.SLATE_GRAY);

  @override
  ThemeColorVariation secondaryThemeColorVariation = ThemeColorVariation(
      primary: Palette.WHITE,
      warning: Palette.WHITE,
      error: Palette.WHITE,
      success: Palette.WHITE, //Palette.green
      info: Palette.WHITE);

  @override
  MaterialColor primarySwatch =
      Palette.GREY.createMaterialColor(); //Palette.green.createMaterialColor();

  @override
  Brightness? accentColorBrightness;

  @override
  Color? backgroundColor = Palette.WHITE;

  @override
  Color? bottomAppBarColor;

  @override
  Brightness? brightness;

  @override
  Color? buttonColor = Palette.GREEN;

  @override
  Color? canvasColor;

  @override
  Color? cardColor = Palette.WHITE;

  @override
  Color? dialogBackgroundColor;

  @override
  Color? disabledColor;

  @override
  Color? dividerColor;

  @override
  Color? errorColor;

  @override
  Color? focusColor;

  @override
  Color? highlightColor;

  @override
  Color? hintColor;

  @override
  Color? hoverColor;

  @override
  Color? indicatorColor;

  @override
  Brightness? primaryColorBrightness;

  @override
  Color? primaryColorDark;

  @override
  Color? primaryColorLight = Palette.WHITE;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? secondaryHeaderColor;

  @override
  Color? selectedRowColor;

  @override
  Color? shadowColor;

  @override
  Color? splashColor;

  @override
  Color? toggleableActiveColor;

  @override
  Color? unselectedWidgetColor;

  @override
  Color accentColor = Palette.WHITE;

  @override
  Color primaryColor = Palette.GREEN; //Palette.blue
}
