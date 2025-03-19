import 'package:flutter/material.dart';

class TimePickerField extends StatelessWidget {
  final String label;
  final String initialValue;
  final Function(String) onChanged;

  const TimePickerField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(41, 17, 112, 141),
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
      controller: TextEditingController(text: initialValue),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          String formattedTime = pickedTime.format(context);
          onChanged(formattedTime);
        }
      },
    );
  }
}
