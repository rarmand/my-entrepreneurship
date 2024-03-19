import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.inputFormatters,
    this.validator,
  });

  final String labelText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?) onChanged; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(), 
          labelText: labelText,
        ),
      ),
    );
  }
}