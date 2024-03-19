import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.maxLength = 20,
    this.inputFormatters,
    this.validator,
  });

  final String labelText;
  final int? maxLength;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String?) onChanged; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator,
        maxLength: maxLength,
        maxLines: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: const OutlineInputBorder(), 
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}