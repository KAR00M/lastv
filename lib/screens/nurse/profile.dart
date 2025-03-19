import 'package:flutter/material.dart';
import '../../widget/bottomNavigationBar.dart';
import '../reminder/Nurse_reminder.dart';
import '../../widget/nurse/Nurse_profile_widget/dropdown_widget.dart';
import '../../widget/nurse/Nurse_profile_widget/number_field_widget.dart';
import '../../widget/nurse/Nurse_profile_widget/phone_field_widget.dart';
import '../../widget/nurse/Nurse_profile_widget/text_field_widget.dart';
import '../../widget/nurse/Nurse_profile_widget/time_picker_widget.dart';
import '../../widget/nurse/Nurse_profile_widget/profile_card_widget.dart';

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const NuraeProfilePage(),
  );
}

class NuraeProfilePage extends StatefulWidget {
  static const String routeName = '/nurse_profile';
  const NuraeProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<NuraeProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  String name = "SALMA AHMED";
  String startTime = "8:00 AM";
  String endTime = "8:00 PM";
  String startDay = "Sat";
  String endDay = "Thu";
  String experience = "10";
  String phone = "0123456789";
  String email = "Salma@gmail.com";
  String about =
      "ممرضة ذات خبرة واسعة في تقديم الرعاية الصحية الشاملة للمرضى بمختلف الحالات. بارعة في تنفيذ الإجراءات الطبية، متابعة العلامات الحيوية، وإدارة الأدوية وفقًا لأعلى معايير السلامة. تتميز بالتواصل الفعال، والتعامل الإنساني.";
  double rating = 4.9;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NuraeProfilePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NurseReminder()),
      );
    }
    // if (index == 2) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const Faviourite()),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          CustomBottomNav(currentIndex: 2, onItemTapped: _onItemTapped),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.blue,
          indicatorWeight: 3,
          labelStyle:
              const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: "Overview"),
            Tab(text: "Edit"),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          _buildOverviewTab(),
          _buildEditTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(29, 119, 176, 223),
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(
              name: name,
              rating: rating,
              startTime: startTime,
              endTime: endTime,
              startDay: startDay,
              endDay: endDay,
              experience: experience,
            ),
            const SizedBox(height: 40),
            const Text("About Nurse:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(
              about,
              textAlign: TextAlign.justify,
              style: const TextStyle(color: Color.fromARGB(184, 0, 0, 0)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(29, 119, 176, 223),
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(top: 60, bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.phone,
                      color: Color.fromARGB(255, 76, 124, 175)),
                  const SizedBox(width: 10),
                  Text(
                    phone,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(29, 119, 176, 223),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  const Icon(Icons.email,
                      color: Color.fromARGB(255, 76, 124, 175)),
                  const SizedBox(width: 10),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              label: "Name",
              initialValue: name,
              onChanged: (value) => setState(() => name = value),
            ),
            const SizedBox(height: 10),
            TimePickerField(
              label: "Start Time",
              initialValue: startTime,
              onChanged: (value) => setState(() => startTime = value),
            ),
            const SizedBox(height: 10),
            TimePickerField(
              label: "End Time",
              initialValue: endTime,
              onChanged: (value) => setState(() => endTime = value),
            ),
            const SizedBox(height: 10),
            CustomDropdown(
              label: "Start Day",
              value: startDay,
              onChanged: (value) => setState(() => startDay = value!),
            ),
            const SizedBox(height: 10),
            CustomDropdown(
              label: "End Day",
              value: endDay,
              onChanged: (value) => setState(() => endDay = value!),
            ),
            const SizedBox(height: 10),
            NumberField(
              label: "Experience (Years)",
              initialValue: experience,
              onChanged: (value) => setState(() => experience = value),
            ),
            const SizedBox(height: 10),
            PhoneField(
              phone: phone,
              onChanged: (value) => setState(() => phone = value),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: "Email",
              initialValue: email,
              onChanged: (value) => setState(() => email = value),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              label: "About Nurse",
              initialValue: about,
              onChanged: (value) => setState(() => about = value),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {});
                  tabController.animateTo(0); // Navigate to Overview tab
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
