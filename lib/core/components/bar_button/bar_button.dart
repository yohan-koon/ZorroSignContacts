import 'package:finap_base_theme/palette.dart';
import 'package:finap_base_theme/theme_variation_type.dart';
import 'package:flutter/material.dart';
import 'package:zorro_sign_contacts/core/components/bar_button/bar_button.simmer.dart';
import 'package:zorro_sign_contacts/core/components/bar_button/bar_button_type.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class BarButton extends StatelessWidget {
  const BarButton(
      {Key? key,
      this.onTap,
      this.title,
      this.prefix,
      this.suffix,
      this.width,
      this.iconSize,
      this.height = 50,
      this.textStyle,
      this.themeVariationType = ThemeVariationType.primary,
      this.secondaryThemeVariationType = ThemeVariationType.primary,
      this.style,
      this.bgColor,
      this.buttonType = BarButtonType.FILLED,
      this.addBackground,
      this.buttonBorderWidth,
      this.shape,
      this.cornerRadius,
      this.padding,
      this.isLoading})
      : super(key: key);

  final Function? onTap;
  final String? title;
  final String? prefix;
  final String? suffix;
  final double? width;
  final double? iconSize;
  final double height;
  final TextStyle? textStyle;
  final ThemeVariationType themeVariationType;
  final ThemeVariationType secondaryThemeVariationType;
  final ButtonStyle? style;
  final Color? bgColor;
  final BarButtonType buttonType;
  final bool? addBackground;
  final double? buttonBorderWidth;
  final RoundedRectangleBorder? shape;
  final double? cornerRadius;
  final EdgeInsets? padding;
  final double _contentWidth = 75;
  final bool? isLoading;
  //final double maxHeight = 50;

  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    return isLoading == true
        ? renderShimmer()
        : renderButtonContainer(context, ts);
  }

  renderShimmer() {
    return Shimmer.fromColors(
        baseColor: Palette.WHISPER,
        highlightColor: Palette.GREY,
        enabled: isLoading == true,
        child: BarButtonSimmer(
          height: height,
        ));
  }

  Widget renderButtonContainer(BuildContext context, ThemeStore ts) {
    return ElevatedButton(
        child: renderContent(context),
        onPressed: () {
          if (onTap != null) {
            onTap!();
          }
        },
        style: ElevatedButton.styleFrom(
            primary: getBgColor(ts),
            onPrimary: getTextColor(ts),
            minimumSize: Size(100.w, height),
            // maximumSize: Size(width, maxHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius ?? height),
            ),
            side: BorderSide(
              width: buttonBorderWidth ?? 1.w,
              color: getBorderColor(ts),
            ),
            padding: padding,
            textStyle: textStyle ??
                (Theme.of(context)
                    .primaryTextTheme
                    .headline3
                    ?.copyWith(fontSize: height / 3))));
  }

  getBgColor(ThemeStore ts) {
    switch (buttonType) {
      case BarButtonType.FILLED:
        return ts.tc.colors.themeColorVariation
            .getColorByVariation(themeVariationType: themeVariationType);
      case BarButtonType.OUTLINED:
        return ts.tc.colors.secondaryThemeColorVariation.getColorByVariation(
            themeVariationType: secondaryThemeVariationType);
      case BarButtonType.UNFILLED:
        return ts.tc.colors.secondaryThemeColorVariation.getColorByVariation(
            themeVariationType: secondaryThemeVariationType);
    }
  }

  getTextColor(ThemeStore ts) {
    switch (buttonType) {
      case BarButtonType.FILLED:
        return ts.tc.colors.secondaryThemeColorVariation.getColorByVariation(
            themeVariationType: secondaryThemeVariationType);
      case BarButtonType.OUTLINED:
        return ts.tc.colors.themeColorVariation
            .getColorByVariation(themeVariationType: themeVariationType);
      case BarButtonType.UNFILLED:
        return ts.tc.colors.themeColorVariation
            .getColorByVariation(themeVariationType: themeVariationType);
    }
  }

  getBorderColor(ThemeStore ts) {
    switch (buttonType) {
      case BarButtonType.FILLED:
        return ts.tc.colors.themeColorVariation
            .getColorByVariation(themeVariationType: themeVariationType);
      case BarButtonType.OUTLINED:
        return ts.tc.colors.themeColorVariation
            .getColorByVariation(themeVariationType: themeVariationType);
      case BarButtonType.UNFILLED:
        return ts.tc.colors.secondaryThemeColorVariation.getColorByVariation(
            themeVariationType: secondaryThemeVariationType);
    }
  }

  Widget renderLeftIcon(
      BuildContext context, String? prefix, double availableSpace) {
    return SizedBox(
      width: height * 0.8,
      child: prefix != null
          ? Align(alignment: Alignment.centerLeft, child: Image.asset(prefix))
          : Container(),
    );
  }

  Widget renderRightIcon(
      BuildContext context, String? suffix, double availableSpace) {
    return SizedBox(
      width: height * 0.8,
      child: suffix != null
          ? Align(
              alignment: Alignment.centerRight,
              child: Image.asset(suffix),
            )
          : Container(),
    );
  }

  Widget renderTitle(BuildContext context, double availableSpace) {
    return Text(
      title ?? 'Button Text',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Widget renderContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        prefix != null
            ? renderLeftIcon(context, prefix, _contentWidth)
            : Container(),
        renderTitle(context, _contentWidth),
        suffix != null
            ? renderRightIcon(context, suffix, _contentWidth)
            : Container()
      ],
    );
  }
}
