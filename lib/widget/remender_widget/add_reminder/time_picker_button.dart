import 'package:flutter/material.dart';

class TimePickerButton extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay?) onTimePicked;

  const TimePickerButton({
    super.key,
    required this.selectedTime,
    required this.onTimePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ElevatedButton.icon(
        onPressed: () async {
          TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          onTimePicked(picked);
        },
        icon: const Icon(Icons.access_time),
        label: Text(
          selectedTime == null ? 'Select Time' : 'Time: ${selectedTime!.format(context)}',
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
