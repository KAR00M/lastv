import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final String label;
  final ValueChanged<String> onTimeSelected;

  const TimePickerWidget({super.key, required this.label, required this.onTimeSelected});

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  String selectedTime = "8:00 AM";

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: widget.label,
      ),
      controller: TextEditingController(text: selectedTime),
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          setState(() {
            selectedTime = pickedTime.format(context);
          });
          widget.onTimeSelected(selectedTime);
        }
      },
    );
  }
}
