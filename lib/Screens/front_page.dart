import 'package:betipl/Screens/bet_match.dart';
import 'package:betipl/Screens/home_page.dart';
import 'package:betipl/controller/usercontroller.dart';

import 'package:flutter/material.dart';
import 'package:betipl/Screens/Topup.dart';
import 'package:betipl/Screens/profile.dart';
import 'package:get/get.dart';
import 'package:betipl/controller/matchcontroller.dart';
import 'package:betipl/Screens/Admin/winnerselector.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int bottomSelectedIndex = 0;
final matchController = Get.put(MatchController());
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
       HomePage(),
        BetMatch(),
        Topup(),
        Profile(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override


  Widget build(BuildContext context) {

  const Color topColor = Colors.black;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: topColor,automaticallyImplyLeading: false,
        leading: Icon(Icons.person,color: Colors.red,size: 30,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GetX<UserController>(
              init: UserController(),
              initState: (_) {},
              builder: (_) {
                return Text("Hello,  ${_.user.name} ",style: TextStyle(fontSize: 16,color: Colors.white),); 
              },
            ),
            OutlineButton(
              child: Text('Admin Panel', style: TextStyle(color: Colors.white,fontSize: 10),),
              onPressed: (){
                Get.find<UserController>().user.post == 'admin'?
                Get.to(WinnerSelector()): Get.snackbar('Sorry!', 'You are not recognized as admin', snackPosition: SnackPosition.BOTTOM, colorText: Colors.white, backgroundColor: Colors.black);
              },
              color: Colors.white,
              borderSide: BorderSide(color: Colors.white),
            
            )
          ],
        ),

      ),
      body: buildPageView(),
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: _currentIndex ,
          type: BottomNavigationBarType.fixed,
          backgroundColor:topColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 12,
          unselectedFontSize: 10,
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: [
            BottomNavigationBarItem(
              
          label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Todays Bet',
              icon: Icon(Icons.attach_money),
            ),
            BottomNavigationBarItem(
              label: 'Top UP',
              icon: Icon(Icons.account_balance_wallet),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        )
    );
  }
}










