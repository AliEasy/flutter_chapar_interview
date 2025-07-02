import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.autovalidateMode,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon, this.textInputAction,
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
      decoration: InputDecoration(labelText: label, suffixIcon: suffixIcon),
    );
  }
}
