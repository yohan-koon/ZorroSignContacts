import 'package:finap_base_theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_bar.shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zorro_sign_contacts/core/components/search_bar/search_debouncer.dart';

class SearchBar extends StatelessWidget {
  final String? initialValue;
  final bool? isMandatory;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
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
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
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
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final String? hintText;
  final TextStyle? hintStyle;
  FloatingLabelBehavior? floatingLabelBehavior = FloatingLabelBehavior.always;
  final EdgeInsets? contentPadding;
  final bool? isDense;
  final String? validationMessage;
  final String? labelText;
  final TextStyle? labelStyle;
  final Function(String?) setValue;
  final SearchBarLabelPosition? labelPosition;
  final Widget? suffixIcon;
  final double? fontSize;
  final TextStyle? topLabelStyle;
  final TextEditingController? controller; // only for read only TF's
  final bool? isLoading;
  final Color? fillColor;
  final SearchDebouncer? searchDebouncer;
  final Function(String?) onSearch;
  final String? value;

  SearchBar(
      {Key? key,
      this.initialValue,
      this.isMandatory = false,
      this.focusNode,
      this.decoration,
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
      this.validator,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth = 1.0,
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
      this.focusedBorder,
      this.errorBorder,
      this.border,
      this.enableBorder,
      this.hintText,
      this.hintStyle,
      this.floatingLabelBehavior,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      this.isDense = true,
      this.validationMessage,
      this.labelText,
      this.labelStyle,
      required this.setValue,
      this.suffixIcon,
      this.labelPosition = SearchBarLabelPosition.top,
      this.fontSize,
      this.topLabelStyle,
      this.controller,
      this.isLoading,
      this.fillColor,
      this.searchDebouncer,
      required this.onSearch,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading == true ? _renderSimmer() : _renderTextField(context);
  }

  _renderSimmer() {
    return Shimmer.fromColors(
        baseColor: Palette.WHITE,
        highlightColor: Palette.GREY,
        enabled: isLoading == true,
        child: const SearchBarShimmer());
  }

  _renderTextField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null ? _topLabel(context) : Container(),
        _textField(context),
      ],
    );
  }

  Widget _topLabel(BuildContext context) {
    return labelPosition == SearchBarLabelPosition.top
        ? Row(
            children: [
              Text(
                labelText ?? 'Field Label',
                style: topLabelStyle ??
                    Theme.of(context).primaryTextTheme.headline4,
              ),
              isMandatory == true
                  ? Text(
                      '*',
                      style: topLabelStyle ??
                          Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              ?.copyWith(color: Palette.RED),
                    )
                  : Container(),
            ],
          )
        : Container();
  }

  Widget _textField(BuildContext context) {
    return TextFormField(
      key: key,
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: decoration ??
          InputDecoration(
            labelText: labelPosition == SearchBarLabelPosition.inline
                ? '${(labelText ?? 'Field Label')}${isMandatory == true ? '*' : ''}'
                : '',
            labelStyle: labelStyle ??
                Theme.of(context).primaryTextTheme.subtitle2?.copyWith(
                      color: Palette.BLACK,
                    ),
            focusedBorder: focusedBorder ??
                const OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.GREEN, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
            errorBorder: errorBorder ??
                const OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.RED, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
            border: border ??
                const OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.WHITE, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
            enabledBorder: enableBorder ??
                const OutlineInputBorder(
                    borderSide: BorderSide(color: Palette.WHITE, width: 0.5),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
            hintText: hintText ?? '',
            hintStyle: hintStyle ??
                Theme.of(context).primaryTextTheme.bodyText2?.copyWith(
                      color: Palette.GREY,
                      fontSize: 13.sp,
                    ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            isDense: isDense ?? true,
            contentPadding: contentPadding, //updated
            fillColor: Palette.WHISPER,
            filled: true,
            suffixIcon: value != null && value != ''
                ? IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller?.clear();
                      setValue(null);
                      searchDebouncer?.run(() {
                        onSearch(null);
                      });
                    },
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction ?? TextInputAction.next,
      style: style ?? TextStyle(fontSize: 14.sp),
      strutStyle: strutStyle,
      textDirection: textDirection,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      toolbarOptions: toolbarOptions,
      showCursor: showCursor,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: (value) {
        setValue(value);
        searchDebouncer?.run(() {
          onSearch(value);
        });
      },
      onTap: onTap,
      onEditingComplete:
          onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: (value) =>
          validationMessage?.isNotEmpty == true ? validationMessage : null,
      inputFormatters: inputFormatters,
      enabled: enabled,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      buildCounter: buildCounter,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      controller: controller,
    );
  }
}

enum SearchBarLabelPosition { top, inline, none }
