import 'package:flutter/material.dart';

/// A TextFormField that disables the system context menu to prevent crashes
/// on certain Android emulators and Flutter versions.
class SafeTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;
  final int? maxLines;
  final String? initialValue;

  const SafeTextFormField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.decoration,
    this.maxLines = 1,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      maxLines: maxLines,
      initialValue: initialValue,
      contextMenuBuilder: (context, editableTextState) {
        // Return an empty container to disable context menu completely
        return const SizedBox.shrink();
      },
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
    );
  }
}

/// A TextField that disables the system context menu to prevent crashes
/// on certain Android emulators and Flutter versions.
class SafeTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;
  final int? maxLines;

  const SafeTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.decoration,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: maxLines,
      contextMenuBuilder: (context, editableTextState) {
        // Return an empty container to disable context menu completely
        return const SizedBox.shrink();
      },
      decoration: decoration ??
          InputDecoration(
            labelText: labelText,
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
    );
  }
}
