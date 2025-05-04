import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String label;
  final String value;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final Widget? prefixIcon;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextInput({
    super.key,
    required this.label,
    required this.value,
    this.obscureText = false,
    required this.onChanged,
    this.prefixIcon,
    this.errorText,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value);

    // Avoid cursor reset on every build
    controller.selection =
        TextSelection.collapsed(offset: controller.text.length);

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
