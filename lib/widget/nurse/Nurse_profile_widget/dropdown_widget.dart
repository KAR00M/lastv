import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"].map((day) {
        return DropdownMenuItem(value: day, child: Text(day));
      }).toList(),
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(41, 17, 112, 141),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
      onChanged: onChanged,
    );
  }
}
