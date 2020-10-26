import 'package:flutter/material.dart';
import 'package:betipl/Screens/Login/login_screen.dart';
import 'package:betipl/Screens/Signup/signup_screen.dart';
import 'package:betipl/Screens/Welcome/components/background.dart';
import 'package:betipl/components/rounded_button.dart';
import 'package:betipl/constants.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bet the Sport",
              style: Theme.of(context).textTheme.headline4
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset('assets/images/welcome.png',),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              color: Color(0xffFB375B),
              text: "LOGIN",
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
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
