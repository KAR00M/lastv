import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/remender_widget/add_reminder/dropdown_field.dart';
import '../../widget/remender_widget/add_reminder/medicine_name_field.dart';
import '../../widget/remender_widget/add_reminder/save_button.dart';
import '../../widget/remender_widget/add_reminder/time_picker_button.dart';

class AddMedicinePage extends StatefulWidget {
  static const String routeName = '/nurseremender';

  final Function(Map<String, String>) addMedicine;

  const AddMedicinePage({super.key, required this.addMedicine});

  @override
  // ignore: library_private_types_in_public_api
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String medicineType = 'Capsule';
  String mealTime = 'Before Meal';
  TimeOfDay? selectedTime;
  String repeatDays = 'Daily';
  String selectedDay = 'Sat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicine')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(16.0.w.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MedicineNameField(
                      controller: _nameController, formKey: _formKey),
                  SizedBox(height: 75.h),
                  DropdownField(
                    label: 'Medicine Type',
                    value: medicineType,
                    items: const ['Capsule', 'Injection', 'Syrup'],
                    onChanged: (val) => setState(() => medicineType = val!),
                  ),
                  SizedBox(height: 75.h),
                  DropdownField(
                    label: 'Select Day',
                    value: selectedDay,
                    items: const [
                      'Sat',
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri'
                    ],
                    onChanged: (val) => setState(() => selectedDay = val!),
                  ),
                  SizedBox(height: 75.h),
                  DropdownField(
                    label: 'Repeat',
                    value: repeatDays,
                    items: const ['Daily', 'Weekly', 'Bi-Weekly'],
                    onChanged: (val) => setState(() => repeatDays = val!),
                  ),
                  SizedBox(height: 15.h),
                  TimePickerButton(
                    selectedTime: selectedTime,
                    onTimePicked: (picked) =>
                        setState(() => selectedTime = picked),
                  ),
                  SizedBox(height: 175.h),
                  SaveButton(
                    formKey: _formKey,
                    nameController: _nameController,
                    medicineType: medicineType,
                    mealTime: mealTime,
                    selectedDay: selectedDay,
                    repeatDays: repeatDays,
                    selectedTime: selectedTime,
                    addMedicine: widget.addMedicine,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
