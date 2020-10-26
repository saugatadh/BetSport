import 'package:flutter/material.dart';
import 'package:betipl/constants.dart';
import 'package:get/get.dart';
import 'package:betipl/controller/usercontroller.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:betipl/controller/authcontroller.dart';
import 'package:betipl/Screens/Welcome/welcome_screen.dart';

class Profile extends StatelessWidget {
 
  
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
    "WIN": double.parse(Get.find<UserController>().user.win.toString()),
    "LOSE":double.parse(Get.find<UserController>().user.win.toString()),
  };
   List<Color> colorList = [
    Colors.red,
    Colors.blue,
  ];
    double screenWidth = MediaQuery.of(context).size.width;
  //    double screenHeight = MediaQuery.of(context).size.height;
  //  Size size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ktopColor ,
      body: Container(
        child: Stack(
          textDirection: TextDirection.ltr,
          children: <Widget>[

            Column(
              children: <Widget>[
                Container(
                  height: 70,
                  width: double.infinity,
                    color: ktopColor,
                ),
                Expanded(
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),
                    child: Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 60,left: 20),
                          child: Text("@${Get.find<UserController>().user.name}",style: TextStyle(fontSize: 18),),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                          Column(children: <Widget>[
                            Text('Rs. ${Get.find<UserController>().user.currentbalance}',style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text('Your account Balance',style: TextStyle(fontSize: 14),),
                          ],),
                          Container(height: 40,width: 2,color: Colors.black,),
                          Column(children: <Widget>[
                            Text('${Get.find<UserController>().user.win}'
                            ,style: TextStyle(fontSize: 25),),
                            SizedBox(height: 10,),
                            Text('Total Wins',style: TextStyle(fontSize: 14),),
                          ],),
                        ],),
                    SizedBox(height: 20,),
                    OutlineButton(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Sign Out',style: TextStyle(fontSize: 18),),
                    ),
                    onPressed: () {
                      Get.find<AuthController>().signOut();
                      Get.to(WelcomeScreen());
                    }, //callback when button is clicked
                    borderSide: BorderSide(
                      color: Colors.red, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width:2,
                      //width of the border
                    ),
                  ),
                          SizedBox(height: 30)
                        ,PieChart(
                            dataMap: dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            chartRadius: MediaQuery.of(context).size.height / 7,
                            colorList: colorList,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                              
                            ringStrokeWidth: 18,
                            centerText: "HYBRID",
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              legendPosition: LegendPosition.right,
                              showLegends: true,
                              
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: true,
                            ),
                  )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 5,
              left:130,
              right: 130,
              child: CircleAvatar(radius: 55,backgroundColor: Colors.transparent,child: Image.asset('assets/images/userlogo.png'),),
            ),
            Positioned(
              bottom: 10,
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  height: 50,
                  width: 300,

                  child: RichText(
                  textAlign: TextAlign.center,
                  text:TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'Thanks for trusting our app.'),
                    TextSpan(text: 'Lets predict and win with your own freinds'),
                  ]
                ),),),
              ),
            ),
            Positioned(
              bottom: 5,

              child: Container(
                width: screenWidth,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(height: 80,width: 130,child: Image.asset('assets/images/esewa_logo.png')),

                  Text('9845965166',style: TextStyle(fontSize: 26),)
                ],
            ),
              ),)
          ],
        ),
      ),

    );
  }
}
