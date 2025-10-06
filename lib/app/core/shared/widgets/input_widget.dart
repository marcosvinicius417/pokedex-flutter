import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../themes/color_theme.dart';
import '../../themes/typography_theme.dart';

class InputWidget extends StatelessWidget {
  final InputDecoration? decoration;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool enabled;
  final String? errorText;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final String? helperText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final bool secondary;
  final bool? autoFocus;
  final Iterable<String>? autofillHints;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final int? maxLength;
  final String label;
  final bool clearButton;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Widget? labelRightIcon;
  final VoidCallback? labelRightIconOnTap;
  final bool needLabelAndRightIcon;

  const InputWidget({
    super.key,
    this.onChanged,
    this.onTap,
    this.hintText,
    this.suffixIcon,
    this.errorText,
    this.focusNode,
    this.textAlign,
    this.maxLength,
    this.decoration,
    this.controller,
    this.prefixIcon,
    this.helperText,
    this.autofillHints,
    this.textInputType,
    this.textInputAction,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textCapitalization,
    this.validator,
    this.label = '',
    this.enabled = true,
    this.readOnly = false,
    this.secondary = false,
    this.autoFocus = false,
    this.clearButton = false,
    this.obscureText = false,
    this.needLabelAndRightIcon = false,
    this.hintStyle,
    this.labelStyle,
    this.labelRightIcon,
    this.labelRightIconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (needLabelAndRightIcon) ...[
          InkWell(
            onTap: labelRightIconOnTap,
            child: Row(
              children: [
                Text(
                  label,
                  style:
                      labelStyle ??
                      labelText.copyWith(color: ColorsTheme.secondaryText),
                ).tr(),
                const SizedBox(width: 10),
                labelRightIcon!,
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        if (label.isNotEmpty && !needLabelAndRightIcon) ...[
          Text(
            label,
            style:
                labelStyle ??
                labelText.copyWith(color: ColorsTheme.secondaryText),
          ).tr(),
          const SizedBox(height: 8),
        ],
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                autofocus: autoFocus ?? false,
                keyboardType: textInputType,
                inputFormatters: inputFormatters,
                textAlign: textAlign ?? TextAlign.start,
                textAlignVertical: TextAlignVertical.bottom,
                onChanged: onChanged,
                obscureText: obscureText,
                obscuringCharacter: '*',
                cursorColor: Theme.of(context).primaryColor,
                enabled: enabled,
                validator: validator,
                onTap: onTap,
                readOnly: readOnly,
                focusNode: focusNode,
                textInputAction: textInputAction,
                onFieldSubmitted: onFieldSubmitted,
                style: h5,
                maxLength: maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                autofillHints: enabled ? autofillHints : null,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                decoration: InputDecoration(
                  counterText: '',
                  suffixIcon: Container(
                    padding: const EdgeInsets.only(right: 15),
                    child: suffixIcon,
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.only(left: 15),
                    child: prefixIcon,
                  ),
                  suffix: SizedBox(width: suffixIcon != null ? 5 : 15),
                  prefix: SizedBox(width: prefixIcon != null ? 5 : 15),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: prefixIcon != null ? 60 : 0,
                    maxWidth: prefixIcon != null ? 60 : 0,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: suffixIcon != null ? 60 : 0,
                    maxWidth: suffixIcon != null ? 60 : 0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorsTheme.primaryText,
                      width: 1.0,
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: hintStyle ?? h3.copyWith(),
                  errorText: errorText == null || errorText == ''
                      ? null
                      : errorText,
                  errorStyle: const TextStyle(fontSize: 14),
                  errorMaxLines: 2,
                  isDense: true,
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorsTheme.error,
                      width: 1.0,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: ColorsTheme.error,
                      width: 1.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 15,
                  ),
                  helperText: helperText,
                  helperStyle: h6.copyWith(
                    color: ColorsTheme.hintText,
                    height: 1,
                  ),
                  helperMaxLines: 2,
                  alignLabelWithHint: true,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ),
            if (clearButton)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 14),
                child: InkWell(
                  onTap: () => controller?.clear(),
                  child: Text(
                    'Limpar',
                    style: h5.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
