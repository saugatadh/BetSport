import 'package:betipl/components/bottom_sheet.dart' as prefix0;
import 'package:betipl/controller/matchcontroller.dart';

import 'package:flutter/material.dart';
import 'package:betipl/components/screenl_layout.dart';


import 'package:get/get.dart';
class BetMatch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF0F9),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: (){
          showBottomSheet(
              context: context,
              builder: (context) =>prefix0.BottomSheet());
        } 
        ,
      ),
      body:ScreenLayout(
        title:  Padding(
          padding: const EdgeInsets.only(top:5.0,bottom: 6),
          child: Container(height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: 50,
                    width: 80,

                    child: Image.network(Get.find<MatchController>().team1logo.toString())),
                Text('VS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Container(
                    height: 50,
                    width: 80,

                    child: Image.network(Get.find<MatchController>().team2logo.toString())),

              ],
            ),
          ),
        ),
        child:
        Get.find<MatchController>().getBetMatches()
      ) ,
    );
  }
}
