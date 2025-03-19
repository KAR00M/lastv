import 'package:flutter/material.dart';
import '../login/patient/login_screen.dart';
import '../../widget/bottomNavigationBar.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});
  static const String routeName = '/profileuser';

  @override
  PatientProfileUser createState() => PatientProfileUser();
}

class PatientProfileUser extends State<UserProfilePage> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Ensure navigation only happens if it's a different page
    if (index != 3) {
      // You should navigate to a different page, not the same ProfilePage
      Navigator.of(context).pop();
      // Replace with actual page
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/abeer.jpeg"),
              ),
            ),
            const SizedBox(height: 16),
            const Text("salma ahmed",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("salmaaa@gmail.com",
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text("Edit Profile"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: const Text("Settings"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.blue),
              title: const Text("Change Password"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 50),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
