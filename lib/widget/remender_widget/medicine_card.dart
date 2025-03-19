import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineCard extends StatelessWidget {
  final Map<String, String> medicine;
  final VoidCallback onDelete;

  const MedicineCard(
      {super.key, required this.medicine, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0.r),
        side: BorderSide(
          color: const Color.fromARGB(126, 33, 149, 243),
          width: 2.w,
        ),
      ),
      elevation: 5,
      shadowColor: Colors.grey,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: ListTile(
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(46, 234, 224, 224),
            border: Border.all(color: const Color.fromARGB(75, 0, 0, 0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.medical_services_outlined),
              SizedBox(width: 10.w),
              Text(
                medicine['name']!,
                style: TextStyle(
                  fontSize: 82.sp,
                  color: const Color.fromRGBO(57, 88, 134, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                _buildInfoRow(
                    Icons.medication_outlined, 'Type: ${medicine['type']}'),
                SizedBox(height: 5.h),
                _buildInfoRow(
                    Icons.fastfood, 'MealTime: ${medicine['mealTime']}'),
                SizedBox(height: 5.h),
                _buildInfoRow(
                    Icons.access_time_outlined, 'Time: ${medicine['time']}'),
                SizedBox(height: 5.h),
                _buildInfoRow(Icons.repeat, 'Repeat: ${medicine['repeat']}'),
              ],
            ),
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(47, 163, 194, 218),
                    offset: Offset(2, 2),
                    spreadRadius: 2,
                    blurRadius: 4,
                  )
                ],
                color: const Color.fromARGB(212, 255, 255, 255),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: const Color.fromARGB(83, 0, 0, 0)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: const Color.fromARGB(203, 9, 39, 63),
                  size: 64.sp,
                ),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 10.w),
        Text(
          text,
          style: TextStyle(
            color: const Color.fromRGBO(57, 88, 134, 1),
            fontSize: 44.sp,
          ),
        ),
      ],
    );
  }
}
