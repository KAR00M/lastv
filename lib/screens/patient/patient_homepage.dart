import '../reminder/patient_reminder.dart';
import 'package:flutter/material.dart';
import 'filter.dart';
import 'profile_user.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/bottomNavigationBar.dart';
import '../../widget/patient/NurseCard.dart';

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PatientHomePage(),
  );
}

class PatientHomePage extends StatefulWidget {
  static const String routeName = '/patient_home';
  const PatientHomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PatientHomePage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 2) {
      Navigator.pushNamed(context, UserProfilePage.routeName);
    }
    if (index == 1) {
      Navigator.pushNamed(context, PatientReminder.routeName);
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNav(currentIndex: 0, onItemTapped: _onItemTapped),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Home', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0).w.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1100.w,
              height: 300.h,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(21, 70, 145, 0.745),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(146.h.w),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Our Best Nurse',
                        style: TextStyle(
                            fontSize: 60.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const Text('All our Steps',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.format_list_bulleted_rounded),
                  onPressed: () {
                    Navigator.pushNamed(context, FilterPage.routeName);
                  },
                ),
                hintText: 'Search a Nurses',
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView(
                children: const [
                  NurseCard(
                    name: 'Abeer Shahin',
                    experience: '15',
                    rating: '5',
                    location: 'الغشام',
                    price: '500',
                    time: '12:00AM - 12:00 PM',
                    image: 'assets/abeer.jpeg',
                  ),
                  NurseCard(
                    name: 'Nada Fawzy',
                    experience: '10',
                    rating: '4.5',
                    location: 'القومية',
                    price: '300',
                    time: '8:00AM - 8:00 PM',
                    image: 'assets/2.jpg',
                  ),
                  NurseCard(
                    name: ' Nourhan Esmail ',
                    experience: '10',
                    rating: '4.5',
                    location: 'القومية',
                    price: '300',
                    time: '8:00AM - 8:00 PM',
                    image: 'assets/nour.jpeg',
                  ),
                  NurseCard(
                    name: 'Esraa Adel',
                    experience: '10',
                    rating: '4.5',
                    location: 'القومية',
                    price: '300',
                    time: '8:00AM - 8:00 PM',
                    image: 'assets/esraa.jpeg',
                  ),
                  NurseCard(
                    name: 'Kareem Hesham',
                    experience: '10',
                    rating: '4.5',
                    location: 'القومية',
                    price: '300',
                    time: '8:00AM - 8:00 PM',
                    image: 'assets/kar.jpeg',
                  ),
                  NurseCard(
                    name: 'ziad Saleh',
                    experience: '10',
                    rating: '4.5',
                    location: 'القومية',
                    price: '300',
                    time: '8:00AM - 8:00 PM',
                    image: 'assets/z.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
