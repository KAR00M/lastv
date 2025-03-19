import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onChanged;

  const NumberField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(41, 17, 112, 141),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
    );
  }
}
