
import 'package:flutter/material.dart';
import 'package:betipl/Screens/Login/login_screen.dart';
import 'package:betipl/Screens/Signup/components/background.dart';
import 'package:betipl/components/already_have_an_account_acheck.dart';
import 'package:betipl/components/rounded_button.dart';
import 'package:betipl/components/rounded_input_field.dart';
import 'package:betipl/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:betipl/controller/authcontroller.dart';
import 'package:get/get.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style:Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: 20,
            ),
            RoundedInputField(
              icon: Icons.person_add,
              hintText: "Your Full Name",
              controller: nameController,
            ),
            RoundedInputField(
              icon: Icons.phone,
              hintText: "Your Phn NO.",
              controller: phoneController,
            ),
            RoundedInputField(
              hintText: "Your Email",
              controller: emailController,
            ),
            RoundedPasswordField(
              controller: passwordController,
            ),
             RoundedButton(text: "SIGNUP", press: () async {
              Get.snackbar(
                    "Waiting For Server Response",
                    'please wait',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.black,
                    
                       );
                  Get.find<AuthController>().createUser(nameController.text, phoneController.text, emailController.text, passwordController.text);
                }
              
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
