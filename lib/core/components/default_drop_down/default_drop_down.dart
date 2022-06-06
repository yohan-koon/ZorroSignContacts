import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:zorro_sign_contacts/core/components/default_drop_down/default_drop_down.shimmer.dart';
import 'package:zorro_sign_contacts/core/components/default_drop_down/default_drop_down_data.dart';
import 'package:zorro_sign_contacts/store/theme_store/theme_store.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class DefaultDropDown extends StatelessWidget {
  final String? initialValue;
  final bool? isMandatory;
  final List<DropdownItemData>? dropdownItemDataList;
  final String? dropDownHint;
  final String? labelText;
  final Color? borderColoer;
  final Color? labelColoer;
  final double? topMargin;
  final double? bottomMargin;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final String? hintText;
  final bool? isDense;
  final InputDecoration? decoration;
  final TextStyle? labelStyle;
  final Function(DropdownItemData?)? setValue;
  final String? validationMessage;
  final FormFieldValidator<DropdownItemData>? validator;
  final DefaultDropDownLabelPosition? labelPosition;
  final FocusNode? focusNode;
  final DropdownItemData? dropdownItemData;

  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<DropdownItemData>? onSaved;
  final List<DropdownMenuItem<String>>? itemsobject;

  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;

  final EdgeInsets? contentPadding;

  final Widget? suffixIcon;
  final double? fontSize;
  final double? height;
  final bool? isLoading;
  const DefaultDropDown(
      {Key? key,
      this.dropDownHint,
      this.labelText,
      this.isMandatory,
      this.dropdownItemDataList,
      this.borderColoer,
      this.labelColoer,
      this.topMargin,
      this.bottomMargin,
      this.initialValue,
      this.setValue,
      this.validationMessage = '',
      this.validator,
      this.labelPosition = DefaultDropDownLabelPosition.top,
      this.focusedBorder,
      this.errorBorder,
      this.border,
      this.enableBorder,
      this.hintText,
      this.isDense,
      this.decoration,
      this.labelStyle,
      this.focusNode,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.textInputAction,
      this.style,
      this.strutStyle,
      this.textDirection,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.autofocus = false,
      this.readOnly = false,
      this.toolbarOptions,
      this.showCursor,
      this.obscuringCharacter = '•',
      this.obscureText = false,
      this.autocorrect = true,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions = true,
      this.maxLines = 1,
      this.minLines,
      this.expands = false,
      this.maxLength,
      this.onTap,
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.enabled,
      this.cursorWidth = 2.0,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.enableInteractiveSelection = true,
      this.selectionControls,
      this.buildCounter,
      this.scrollPhysics,
      this.autofillHints,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.contentPadding,
      this.suffixIcon,
      this.fontSize,
      this.itemsobject,
      this.dropdownItemData,
      this.height,
      this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    return isLoading == true ? renderSimmer() : renderDropDown(context, ts);
  }

  renderSimmer() {
    return Shimmer.fromColors(
        baseColor: Palette.WHITE,
        highlightColor: Palette.GREY,
        enabled: isLoading == true,
        child: DefaultDropDownShimmer(
          isVisibleLabel: labelPosition == DefaultDropDownLabelPosition.top &&
              labelText != null &&
              labelText?.isNotEmpty == true,
        ));
  }

  renderDropDown(BuildContext context, ThemeStore ts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topLabel(context, ts),
        _dropdownField(ts, context),
      ],
    );
  }

  Widget _topLabel(BuildContext context, ThemeStore ts) {
    return labelPosition == DefaultDropDownLabelPosition.top &&
            labelText != null &&
            labelText?.isNotEmpty == true
        ? Container(
            margin: EdgeInsets.only(
              top: topMargin ?? 0,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      labelText ?? '',
                      style: Theme.of(context).primaryTextTheme.headline4,
                    ),
                    isMandatory == true
                        ? Text(
                            '*',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5
                                ?.copyWith(color: Palette.RED),
                          )
                        : Container(),
                  ],
                )),
          )
        : Container();
  }

//Theme.of(context).primaryTextTheme.headline2
  Widget _dropdownField(ThemeStore ts, BuildContext context) {
    DropdownItemData? dropdownItemTempData;
    List<DropdownItemData>? dropdownItemDataTempList;
    if (dropdownItemDataList == null ||
        dropdownItemDataList!.isEmpty ||
        dropdownItemDataList!.isEmpty) {
      dropdownItemTempData = null;
      dropdownItemDataTempList = [];
    } else {
      dropdownItemDataTempList = dropdownItemDataList ?? [];
      dropdownItemTempData = dropdownItemDataList != null &&
              dropdownItemData != null &&
              dropdownItemData?.id != null
          ? dropdownItemDataList!
              .where((i) => (i.id == (dropdownItemData?.id ?? 0)))
              .toList()[0]
          : dropdownItemDataList![0];
    }

    return Padding(
      padding: EdgeInsets.only(top: 8.w),
      child: SizedBox(
          height: height,
          child: DropdownButtonFormField<DropdownItemData>(
            // decoration: InputDecoration.collapsed(hintText: ''),
            focusColor: Palette.GREEN,
            decoration: decoration ??
                InputDecoration(
                  labelText: labelPosition ==
                          DefaultDropDownLabelPosition.inline
                      ? '${(labelText ?? '')}${isMandatory == true ? '*' : ''}'
                      : '',
                  labelStyle: labelStyle ??
                      Theme.of(context)
                          .primaryTextTheme
                          .subtitle2
                          ?.copyWith(color: Palette.BLACK, fontSize: 12.sp),
                  focusedBorder: focusedBorder ??
                      OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Palette.GREEN, width: 1.0),
                          borderRadius: BorderRadius.circular(2.5.w)),
                  errorBorder: errorBorder ??
                      OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Palette.RED, width: 1.0),
                          borderRadius: BorderRadius.circular(2.5.w)),
                  border: border ??
                      OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.SLATE_GRAY.withOpacity(0.2),
                              width: 1),
                          borderRadius: BorderRadius.circular(2.5.w)),
                  enabledBorder: enableBorder ??
                      OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Palette.SLATE_GRAY.withOpacity(0.2),
                              width: 1),
                          borderRadius: BorderRadius.circular(2.5.w)),
                  hintText: hintText ?? '',
                  isDense: isDense ?? true,

                  contentPadding: contentPadding ??
                      EdgeInsets.symmetric(
                          vertical: 2.w, horizontal: 4.w), //updated
                ),
            hint: Text(dropDownHint ?? ''),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 4.h,
            elevation: 10,
            dropdownColor: Colors.white,
            value: dropdownItemTempData,
            items: dropdownItemDataTempList
                .map<DropdownMenuItem<DropdownItemData>>(
                    (DropdownItemData value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value.name,
                  style: TextStyle(fontSize: 14.5.sp, color: Palette.BLACK),
                ),
              );
            }).toList(),

            onChanged: (value) {
              dropdownItemTempData = value;
              if (setValue != null) {
                setValue!(value);
              }
            },

            validator: validator ??
                (value) => validationMessage != null
                    ? validationMessage!.isNotEmpty == true
                        ? validationMessage
                        : null
                    : null,

            autofocus: autofocus,
            onTap: onTap,
            onSaved: onSaved,
            autovalidateMode: autovalidateMode,
          )),
    );
  }
}

enum DefaultDropDownLabelPosition { top, inline, none }
