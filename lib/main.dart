import 'package:betipl/controller/authcontroller.dart';
import 'package:betipl/controller/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:betipl/Screens/Welcome/welcome_screen.dart';
import 'package:betipl/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MyApp());
} 


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final UserController userController= Get.put(UserController());
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          textTheme: TextTheme(
  headline1: GoogleFonts.montserrat(
    fontSize: 97,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5
  ),
  headline2: GoogleFonts.montserrat(
    fontSize: 61,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5
  ),
  headline3: GoogleFonts.montserrat(
    fontSize: 48,
    fontWeight: FontWeight.w400
  ),
  headline4: GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 34,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25
  ),
  headline5: GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w400
  ),
  headline6: GoogleFonts.montserrat(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15
  ),
  subtitle1: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15
  ),
  subtitle2: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1
  ),
  bodyText1: GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5
  ),
  bodyText2: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25
  ),
  button: GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25
  ),
  caption: GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4
  ),
  overline: GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5
  ),
),
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor:Colors.black,
        ),
        home: WelcomeScreen(),
      );
  }
}
//  Color(0xff121212),