import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.name,
    required this.labelText,
    this.valueTransformer,
    this.keyboardType = TextInputType.text,
    this.maxLength = 20,
    this.inputFormatters,
    this.validator,
  });

  final String name;
  final String labelText;

  final int? maxLength;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  final dynamic Function(String?)? valueTransformer; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), 
      child: FormBuilderTextField(
        name: name,
        valueTransformer: valueTransformer,
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