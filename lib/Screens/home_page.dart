import 'package:betipl/controller/matchcontroller.dart';

import 'package:betipl/controller/usercontroller.dart';
import 'package:flutter/material.dart';
import 'package:betipl/Screens/withdraw.dart';
import 'package:betipl/components/screenl_layout.dart';
import 'package:betipl/constants.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    // double widthOfScreen = MediaQuery.of(context).size.width;
    const Color iconColor = kiconColor;
    return  ScreenLayout(
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(child: Row(children: <Widget>[
            Container(child: Icon(Icons.account_balance_wallet,size: 50,color: iconColor,),),
            SizedBox(width: 10,),
            Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              GetX<UserController>(
                init: UserController(),
                initState: (_) {},
                builder: (_) {
                  return Text("Rs. ${_.user.currentbalance}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),); 
                },
              ),
             
              Text('Available Balance',style: TextStyle(fontSize: 12, color: Colors.grey),)
            ],
            )
          ],),),
          Container(height: 80,width: 2,color: Colors.black,),
          GestureDetector(
             onTap: (){
              Get.to(Withdraw());
              },
             child: Container(child: Row(children: <Widget>[
              Container(
              child: Icon(Icons.account_balance,size: 40,color: iconColor,),),
              SizedBox(width: 10,),
              Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                Text('Withdraw', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ],
              )
            ],),),
          ),
        ],
      ) ,
      child: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 14,top: 16,bottom: 10),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Upcoming Fixtures',
              style: TextStyle(fontSize: 25,),
            ),
              Expanded(child: Get.find<MatchController>().getMatches()),
             
          ],
        ),
      ),

    );
  }
}
