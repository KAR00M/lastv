import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  final String label;
  final ValueChanged<String> onDateSelected;

  const DatePickerWidget({super.key, required this.label, required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  String selectedDate = "1/7/2024";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: widget.label,
      ),
      controller: TextEditingController(text: selectedDate),
      onTap: () async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );

  if (pickedDate != null) { // ✅ Check if pickedDate is null before using it
    setState(() {
      selectedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    });
    widget.onDateSelected(selectedDate);
  }
}

    );
  }
}
