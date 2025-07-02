import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFormFieldType { email, phone, normal }

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final TextFormFieldType textFormFieldType;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.autovalidateMode,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.textInputAction,
    this.onFieldSubmitted,
    this.textFormFieldType = TextFormFieldType.normal,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: autovalidateMode,
      readOnly: readOnly,
      onTap: onTap,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: _getInputFormatters(),
      keyboardType: _getKeyboardType(),
      decoration: InputDecoration(labelText: label, suffixIcon: suffixIcon),
    );
  }

  TextInputType _getKeyboardType() {
    switch (textFormFieldType) {
      case TextFormFieldType.normal:
        return TextInputType.text;
      case TextFormFieldType.email:
        return TextInputType.emailAddress;
      case TextFormFieldType.phone:
        return TextInputType.phone;
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    final List<TextInputFormatter> list = [];
    final maxLength = _getMaxLength();
    if (maxLength != null) {
      list.add(maxLength);
    }
    if (textFormFieldType == TextFormFieldType.phone) {
      list.add(FilteringTextInputFormatter.digitsOnly);
    }
    return list;
  }

  LengthLimitingTextInputFormatter? _getMaxLength() {
    if (textFormFieldType == TextFormFieldType.phone) {
      return LengthLimitingTextInputFormatter(11);
    }
    return null;
  }
}
