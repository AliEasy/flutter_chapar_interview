import 'package:flutter/material.dart';
import 'package:flutter_chapar_interview/core/uikit/text_form_field_widget.dart';

class DatePickerWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final String label;
  final AutovalidateMode? autovalidateMode;
  final DateTime? initialDate;

  const DatePickerWidget({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
    this.autovalidateMode, this.initialDate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: controller,
      label: label,
      autovalidateMode: autovalidateMode,
      readOnly: true,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: initialDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          controller.text = '${picked.year}-${picked.month}-${picked.day}';
        }
      },
      validator: validator,
      suffixIcon: const Icon(Icons.date_range_rounded),
    );
  }
}
