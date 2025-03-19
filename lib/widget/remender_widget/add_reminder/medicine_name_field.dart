import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineNameField extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const MedicineNameField({
    super.key,
    required this.controller,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Medicine Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          prefixIcon: const Icon(Icons.medical_services),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Medicine name is required';
          }
          return null;
        },
      ),
    );
  }
}
