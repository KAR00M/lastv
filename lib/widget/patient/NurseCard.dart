import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../screens/patient/profile_patient_nurse.dart';

class NurseCard extends StatelessWidget {
  final String name, experience, rating, location, price, time, image;

  const NurseCard({
    super.key,
    required this.name,
    required this.experience,
    required this.rating,
    required this.location,
    required this.price,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w), // Adjusted padding with ScreenUtil
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                image,
                width: 300.w,
                height: 320.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 46.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 48.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$experience سنة خبرة',
                    style: TextStyle(fontSize: 34.sp, color: Colors.grey),
                  ),
                  Text(
                    location,
                    style:
                        TextStyle(fontSize: 44.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    time,
                    style: TextStyle(fontSize: 34.sp, color: Colors.green),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                // IconButton(
                //   icon: Icon(Icons.favorite_border, size: 24.sp),
                //   onPressed: () {},
                // ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfilePatientNurse.routeName);
                  },
                  child: Text('Book Now', style: TextStyle(fontSize: 44.sp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
