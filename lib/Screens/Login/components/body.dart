
import 'package:betipl/controller/authcontroller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:betipl/Screens/Login/components/background.dart';
import 'package:betipl/Screens/Signup/signup_screen.dart';
import 'package:betipl/components/already_have_an_account_acheck.dart';
import 'package:betipl/components/rounded_button.dart';
import 'package:betipl/components/rounded_input_field.dart';
import 'package:betipl/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';




class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
 
 
  @override
    void dispose(){
      passwordcontroller.dispose();
      emailcontroller.dispose();
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
      "LOGIN",
      style: Theme.of(context).textTheme.headline6,
    ),
    SizedBox(height: size.height * 0.03),
    SvgPicture.asset(
      "assets/icons/login.svg",
      height: size.height * 0.35,
      
    ),
    SizedBox(height: size.height * 0.03),
    RoundedInputField(
      hintText: "Your Email",
      controller: emailcontroller,
    ),
    RoundedPasswordField(
      controller: passwordcontroller,
    ), 
    RoundedButton(
      text: "LOGIN",
      press: ()async{
         Get.snackbar(
                    "Waiting For Server Response",
                    'please wait',
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.white,
                    backgroundColor: Colors.black,
                       );
            Get.find<AuthController>().login(emailcontroller.text, passwordcontroller.text);
           
        
       
      },
    ),
    SizedBox(height: size.height * 0.03),
    AlreadyHaveAnAccountCheck(
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
