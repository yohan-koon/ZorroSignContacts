import 'package:finap_base_theme/palette.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zorro_sign_contacts/theme/theme_values/base_svgs.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final TextStyle? titleStyle;
  final bool? isTransparent;
  final double? elevation;
  final Widget? flexibleSpace;
  final Color? bgColor;

  final IconData? leadingImage;
  final Function? onPressLeading;
  final bool? isHandleBackNavigation;
  final Widget? trailingImage;
  final Function? onPressTrailing;
  final double size;

  BaseAppBar(
      {Key? key,
      this.title,
      this.titleWidget,
      this.titleStyle,
      this.isTransparent = false,
      this.elevation,
      this.flexibleSpace,
      this.bgColor,
      this.leadingImage,
      this.onPressLeading,
      this.isHandleBackNavigation = true,
      this.trailingImage,
      this.onPressTrailing,
      this.size = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    return AppBar(
      flexibleSpace: flexibleSpace,
      elevation: isTransparent == true ? 0 : elevation,
      title: _titleWidget(context),
      backgroundColor: bgColor ??
          (isTransparent == true ? Colors.transparent : Palette.WHITE),
      titleSpacing: 0,
      leading: _leadingWidget(context),
      //leading: leadingWidget(context),
      leadingWidth: size / 2,
      actions: <Widget>[_trailingWidget(context)],
      centerTitle: onPressLeading == null && isHandleBackNavigation == false
          ? true
          : false,
    );
  }

  Widget _titleWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: titleWidget ?? Text(
        title ?? '',
        style: titleStyle ??
            Theme.of(context).primaryTextTheme.headline5?.copyWith(
                color: Palette.BLACK,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
      ),
    );
  }

  Widget _leadingWidget(BuildContext context) {
    return onPressLeading != null || isHandleBackNavigation == true
        ? IconButton(
            onPressed: () {
              if (onPressLeading != null) {
                onPressLeading!();
              } else if (isHandleBackNavigation == true) {
                Navigator.pop(context);
              }
            },
            icon: Icon(leadingImage ?? Icons.arrow_back))
        : Container();
  }

  Widget _trailingWidget(BuildContext context) {
    return IconButton(onPressed: () => {}, icon: trailingImage ?? Container());
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
