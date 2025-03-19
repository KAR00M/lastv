// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'signup_screen.dart';
import '../../../widget/login_widget/custom_button.dart';
import '../../../widget/login_widget/custom_text_form_field.dart';
import '../../patient/patient_homepage.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Image Section
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/welcom_photo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 28),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Login Form Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sign In Text
                      const Text(
                        "SIGN IN",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                            color: Color(0xFF638ECB)),
                      ),
                      const SizedBox(height: 5),
                      const Text("Enter your detail", style: TextStyle(color: Colors.grey)),

                      const SizedBox(height: 20),

                      // Email Field
                      CustomTextField(
                        label: "Email",
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // Password Field
                      CustomTextField(
                        label: "Password",
                        controller: passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: false, onChanged: (value) {}),
                              const Text("Remember me"),
                            ],
                          ),
                          InkWell(
                            onTap: (){
                              // AwesomeDialog(
                              //     context: context,
                              //     dialogType: DialogType.error,
                              //     animType: AnimType.topSlide,
                              //     title: 'Error',
                              //     desc: 'Please go to your email to reset your password',
                              //     btnCancelOnPress: () {},
                              //     btnOkOnPress: () {},
                              // ).show();
                            },
                            child: const Text(
                              "forget?",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(text: "SIGN IN",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                 Navigator.pushNamed(context, PatientHomePage.routeName);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            // OR Text
            const Text("or", style: TextStyle(fontSize: 16,
                fontWeight: FontWeight.bold, color: Color(0xFF638ECB))),

            const SizedBox(height: 10),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red, size: 30),
                ),
                const SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 30),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      child: const Text("SIGN UP",
                        style: TextStyle(color: Colors.red,
                            fontWeight: FontWeight.bold),)),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
