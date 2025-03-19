import 'package:flutter/material.dart';
import '../patient/patient_homepage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../patient/profile_user.dart';
import '../../widget/bottomNavigationBar.dart';
import '../../widget/remender_widget/medicine_card.dart';
import 'add_medicine_page.dart';

class PatientReminder extends StatefulWidget {
  static const String routeName = '/patinetremender';

  const PatientReminder({super.key});

  @override
  _patientReminderAppState createState() => _patientReminderAppState();
}

class _patientReminderAppState extends State<PatientReminder> {
  List<Map<String, String>> medicines = [];

  void addMedicine(Map<String, String> medicine) {
    setState(() {
      medicines.add(medicine);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medicine Reminder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: remenderHomePage(medicines: medicines, addMedicine: addMedicine),
    );
  }
}

class remenderHomePage extends StatefulWidget {
  final List<Map<String, String>> medicines;
  final Function(Map<String, String>) addMedicine;

  const remenderHomePage(
      {super.key, required this.medicines, required this.addMedicine});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<remenderHomePage> {
  String selectedDay = '';

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (index == 2) {
      Navigator.pushNamed(context, UserProfilePage.routeName);
    }
    // if (index == 1) {
    //   Navigator.pushNamed(context, PatientReminder.routeName);
    // }

    if (index == 0) {
      Navigator.pushNamed(context, PatientHomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNav(currentIndex: 1, onItemTapped: _onItemTapped),
      appBar: AppBar(
          title: const Text('Medicine Reminder'),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: Container(
        padding: EdgeInsets.all(5.w.h),
        decoration: BoxDecoration(
          border:
              Border.all(width: 3.w, color: const Color.fromARGB(75, 0, 0, 0)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(13, 16, 117, 194),
              offset: Offset(4, 10),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 236, 244),
                border: Border.all(),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(129, 167, 186, 201),
                    offset: Offset(4, 10),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(7, (index) {
                    String day = [
                      'Sat',
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri'
                    ][index];
                    bool isActive =
                        selectedDay == day; // Check if button is active
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(70, 60, 155, 228),
                                offset: Offset(4, 10),
                                spreadRadius: 2,
                                blurRadius: 2,
                              )
                            ],
                            border: Border.all()),
                        child: MaterialButton(
                          minWidth: 300.w,
                          height: 450.h,
                          textColor: isActive
                              ? Colors.white // Text color when active
                              : const Color.fromARGB(255, 4, 31, 68),
                          color: isActive
                              ? Colors.blue // Active button color
                              : const Color.fromARGB(255, 255, 255, 255),
                          onPressed: () {
                            setState(() {
                              selectedDay = day;
                            });
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                day,
                                style: TextStyle(fontSize: 48.sp),
                              ),
                              Text('${index + 1}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.medicines.length,
                itemBuilder: (context, index) {
                  if (selectedDay.isEmpty ||
                      widget.medicines[index]['day'] == selectedDay) {
                    return MedicineCard(
                      medicine: widget.medicines[index],
                      onDelete: () {
                        setState(() {
                          widget.medicines.removeAt(index);
                        });
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.w.h),
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddMedicinePage(addMedicine: widget.addMedicine),
                  ),
                ),
                color: const Color.fromARGB(255, 76, 116, 175),
                textColor: Colors.white,
                minWidth: 200.w,
                height: 180.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.add),
                    SizedBox(width: 8.w),
                    const Text('Add Medicine'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
