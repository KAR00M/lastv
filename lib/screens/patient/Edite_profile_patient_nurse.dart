import 'package:flutter/material.dart';
import '../../widget/patient/profile_patient_nurse_widgets/detail_card_widget.dart';



class EditeProfilePatientNurse extends StatelessWidget {
    static const String routeName = '/Editeprofile';

  final List<String> selectedServices;
  final int totalPrice;
  final String selectedTime;
  final String selectedDate;

  // Static User Information
  final String name = "John Doe";
  final String gender = "Male";
  final String phoneNumber = "+201234567890";

  const EditeProfilePatientNurse({
    super.key,
    required this.selectedServices,
    required this.totalPrice,
    required this.selectedTime,
    required this.selectedDate,
  });

  void _confirmBooking(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Booking Confirmed!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Booking Confirmation",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromRGBO(57, 88, 134, 1.0),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  // User Details
                  DetailCardWidget(
                      title: "Name", value: name, icon: Icons.person),
                  DetailCardWidget(
                      title: "Gender",
                      value: gender,
                      icon: Icons.person_outline),
                  DetailCardWidget(
                      title: "Phone", value: phoneNumber, icon: Icons.phone),

                  // Selected Services
                  const SizedBox(height: 20),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(top: 5, bottom: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
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
                            child: const Text("Selected Services:",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                        Column(
                          children: selectedServices
                              .map((service) => Text(
                                    "- $service",
                                    style:
                                        const TextStyle(fontWeight: FontWeight.bold),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Booking Details
                  DetailCardWidget(
                      title: "Total Price",
                      value: "$totalPrice EGP",
                      icon: Icons.attach_money),
                  DetailCardWidget(
                      title: "Time",
                      value: selectedTime,
                      icon: Icons.access_time),
                  DetailCardWidget(
                      title: "Date",
                      value: selectedDate,
                      icon: Icons.date_range),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () => _confirmBooking(context),
                    child: const Text("Confirm Booking",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
