import 'package:flutter/material.dart';
import 'screens/login/selection_screen.dart';
import 'screens/login/nurse/signup_nurse_screen.dart';
import 'screens/login/splash_screen.dart';
import 'screens/login/onboarding_screen.dart';
import 'screens/login/patient/login_screen.dart';
import 'screens/login/patient/signup_screen.dart';
import 'screens/login/nurse/nurse_login_screen.dart';
import 'screens/nurse/nurse_homepage.dart';
import 'screens/nurse/profile.dart';
import 'screens/patient/patient_homepage.dart';
import 'screens/patient/profile_patient_nurse.dart';
import 'screens/patient/profile_user.dart';
import 'screens/patient/filter.dart';
// import 'screens/patient/Edite_profile_patient_nurse.dart';
import 'screens/reminder/Nurse_reminder.dart';
// import 'screens/reminder/add_medicine_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/reminder/patient_reminder.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(1080, 2400), // Adjust based on your design
      minTextAdapt: true,
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      initialRoute: SplashScreen.routeName,
          

      routes: <String, WidgetBuilder>{
        SplashScreen.routeName: (context) => const SplashScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SelectionScreen.routeName: (context) => const SelectionScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        NurseLoginScreen.routeName: (context) => NurseLoginScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        SignupNurseScreen.routeName: (context) => const SignupNurseScreen(),


        NurseDetailsApp.routeName: (context) => const NurseDetailsApp(),
        NuraeProfilePage.routeName: (context) => const NuraeProfilePage(),


        PatientHomePage.routeName: (context) => const PatientHomePage(),
        ProfilePatientNurse.routeName: (context) => const ProfilePatientNurse(),
        UserProfilePage.routeName: (context) => const UserProfilePage(),
        FilterPage.routeName: (context) => const FilterPage(),
        // EditeProfilePatientNurse.routeName: (context) =>  EditeProfilePatientNurse(),

        
        PatientReminder.routeName: (context) => const PatientReminder(),
        NurseReminder.routeName: (context) => const NurseReminder(),
        // AddMedicinePage.routeName: (context) => AddMedicinePage(),       
       
      },
    );
  }
}
