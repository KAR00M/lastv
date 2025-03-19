import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final String medicineType;
  final String mealTime;
  final String selectedDay;
  final String repeatDays;
  final TimeOfDay? selectedTime;
  final Function(Map<String, String>) addMedicine;

  const SaveButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.medicineType,
    required this.mealTime,
    required this.selectedDay,
    required this.repeatDays,
    required this.selectedTime,
    required this.addMedicine,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            addMedicine({
              'name': nameController.text,
              'type': medicineType,
              'mealTime': mealTime,
              'time': selectedTime?.format(context) ?? 'Not Set',
              'day': selectedDay,
              'repeat': repeatDays,
            });
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 76, 116, 175),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 25.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        child: Text(
          'Save Medicine',
          style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
