import 'package:flutter/material.dart';
import '../../widget/patient/profile_patient_nurse_widgets/buildDatePicker.dart';
import '../../widget/patient/profile_patient_nurse_widgets/buildTimePicker.dart';
import 'Edite_profile_patient_nurse.dart';


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePatientNurse(),
    );
  }


class ProfilePatientNurse extends StatefulWidget {
    static const String routeName = '/profile_patient_nurse';

  const ProfilePatientNurse({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePatientNurseState createState() => _ProfilePatientNurseState();
}

class _ProfilePatientNurseState extends State<ProfilePatientNurse> {
  final Map<String, String> prices = {
    "تغيير علي جروح القدم السكري": "200",
    "تركيب محاليل": "150",
    "تركيب كانولا": "100",
    "تمريض منزلي": "300",
    "عمل الحجامة النبوية": "250",
    "اعطاء حقن عضلي ووريد وتحت الجلد": "120",
    "تركيب قسطرة بولية": "180",
    "قياس الضغط والسكر": "80",
    "اختبار حساسيه": "90",
    "تغيير علي جروح العمليات الجراحية": "220",
    "غيار علي الحروق": "210",
    "حقن شرجية": "130",
  };

  List<String> selectedServices = [];
  String selectedTime = "8:00 AM";
  String selectedDate = "1/7/2024";

  void _navigateToBookingPage() {
    int totalPrice = selectedServices.fold(
        0, (sum, service) => sum + int.parse(prices[service]!));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditeProfilePatientNurse(
          selectedServices: selectedServices,
          totalPrice: totalPrice,
          selectedTime: selectedTime,
          selectedDate: selectedDate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Nurse Details", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(57, 88, 134, 1.0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Time Picker
            TimePickerWidget(
              label: "Select Time",
              onTimeSelected: (time) {
                setState(() {
                  selectedTime = time;
                });
              },
            ),
            const SizedBox(height: 10),

            // Date Picker
            DatePickerWidget(
              label: "Select Date",
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 20),

            // Services Selection (Scrollable)
            const Text("Select Services:",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(129, 167, 186, 201),
                      offset: Offset(4, 10),
                      spreadRadius: 2,
                      blurRadius: 2,
                    )
                  ],
                ),
                child: ListView(
                  children: prices.keys.map((service) {
                    return CheckboxListTile(
                      title: Text("$service - ${prices[service]} EGP"),
                      value: selectedServices.contains(service),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            selectedServices.add(service);
                          } else {
                            selectedServices.remove(service);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _navigateToBookingPage,
              child: const Text("Book Now", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

