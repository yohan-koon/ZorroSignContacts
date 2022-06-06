import 'package:finap_base_theme/base_components_theme_data.dart';
import 'package:finap_base_theme/palette.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/dimensions.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/colors.dart'
    as theme_colors;
import 'package:flutter/material.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/fonts.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/text_themes.dart';

class ComponentsThemeData extends BaseComponentsThemeData {
  ComponentsThemeData(
      {required this.colors,
      required this.fonts,
      required this.textThemes,
      required this.dimensions});

  final theme_colors.Colors colors;
  final Fonts fonts;
  final TextThemes textThemes;
  final Dimensions dimensions;

  @override
  IconThemeData? get accentIconTheme {
    return const IconThemeData();
  }

  @override
  AppBarTheme? get appBarTheme {
    return const AppBarTheme(
        centerTitle: true,
        backgroundColor: Palette.WHITE,
        iconTheme: IconThemeData(color: Palette.BLACK),
        toolbarTextStyle: TextStyle(),
        actionsIconTheme: IconThemeData(color: Palette.GREEN));
  }

  @override
  MaterialBannerThemeData? get bannerTheme {
    return const MaterialBannerThemeData();
  }

  @override
  BottomAppBarTheme? get bottomAppBarTheme {
    return const BottomAppBarTheme();
  }

  @override
  BottomNavigationBarThemeData? get bottomNavigationBarTheme {
    return const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Palette.GREEN),
        unselectedIconTheme: IconThemeData(color: Palette.GREY),
        selectedItemColor: Palette.BLACK,
        elevation: 0,
        backgroundColor: Palette.WHITE);
  }

  @override
  BottomSheetThemeData? get bottomSheetTheme {
    return const BottomSheetThemeData();
  }

  @override
  ButtonBarThemeData? get buttonBarTheme {
    return const ButtonBarThemeData();
  }

  @override
  CardTheme? get cardTheme {
    return const CardTheme();
  }

  @override
  CheckboxThemeData? get checkboxTheme {
    return const CheckboxThemeData();
  }

  @override
  ChipThemeData? get chipTheme {
    return null;
  }

  @override
  ColorScheme? get colorScheme {
    return null;
  }

  @override
  DataTableThemeData? get dataTableTheme {
    return null;
  }

  @override
  DialogTheme? get dialogTheme {
    return null;
  }

  @override
  DividerThemeData? get dividerTheme {
    return null;
  }

  @override
  ElevatedButtonThemeData? get elevatedButtonTheme {
    return const ElevatedButtonThemeData(style: ButtonStyle());
  }

  @override
  FloatingActionButtonThemeData? get floatingActionButtonTheme {
    return FloatingActionButtonThemeData(
        backgroundColor: Palette.GREEN,
        foregroundColor: Palette.WHITE,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)));
  }

  @override
  IconThemeData? get iconThemeData {
    return null;
  }

  @override
  InputDecorationTheme? get inputDecorationTheme {
    return null;
  }

  @override
  MaterialTapTargetSize? get materialTapTargetSize {
    return null;
  }

  @override
  NavigationRailThemeData? get navigationRailTheme {
    return null;
  }

  @override
  OutlinedButtonThemeData? get outlinedButtonTheme {
    return null;
  }

  @override
  PageTransitionsTheme? get pageTransitionsTheme {
    return null;
  }

  @override
  TargetPlatform? get platform {
    return null;
  }

  @override
  PopupMenuThemeData? get popupMenuTheme {
    return null;
  }

  @override
  IconThemeData? get primaryIconTheme {
    return null;
  }

  @override
  RadioThemeData? get radioTheme {
    return null;
  }

  @override
  ScrollbarThemeData? get scrollbarTheme {
    return null;
  }

  @override
  SliderThemeData? get sliderTheme {
    return null;
  }

  @override
  SnackBarThemeData? get snackBarTheme {
    return null;
  }

  @override
  SwitchThemeData? get switchTheme {
    return null;
  }

  @override
  TabBarTheme? get tabBarTheme {
    return TabBarTheme(
      labelStyle:
          textThemes.primaryTextTheme?.bodySmall?.copyWith(fontSize: 15.sp),
      unselectedLabelStyle:
          textThemes.primaryTextTheme?.bodySmall?.copyWith(fontSize: 15.sp),
      labelPadding: EdgeInsets.zero,
      labelColor: Palette.BLACK,
      indicator: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Palette.GREEN,
            width: 4.0,
          ),
        ),
      ),
    );
  }

  @override
  TextButtonThemeData? get textButtonTheme {
    return null;
  }

  @override
  TextSelectionThemeData? get textSelectionTheme {
    return null;
  }

  @override
  TimePickerThemeData? get timePickerTheme {
    return null;
  }

  @override
  TooltipThemeData? get tooltipTheme {
    return null;
  }

  @override
  Typography? get typography {
    return null;
  }

  @override
  ToggleButtonsThemeData? get toggleButtonsTheme {
    return null;
  }

  @override
  ButtonThemeData? get getbuttonTheme {
    return null;
  }
}
