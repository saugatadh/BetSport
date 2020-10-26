import 'package:flutter/material.dart';
import 'package:betipl/components/screenl_layout.dart';
import 'package:betipl/constants.dart';
import 'package:betipl/controller/usercontroller.dart';
import 'package:get/get.dart';
import 'package:betipl/controller/matchcontroller.dart';

class Withdraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final amountcontroller = TextEditingController();
    final phncontroller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.black,automaticallyImplyLeading: false,
        leading: Icon(Icons.person,size: 30,color: Colors.red,),
        title: GetX<UserController>(
          init: UserController(),
          initState: (_) {},
          builder: (_) {
            return Text("Hello,  ${_.user.name} ",style: TextStyle(fontSize: 16,color: Colors.white),); 
          },
        ),

      ),
          body: ScreenLayout(
        title: Container(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(child: Icon(Icons.account_balance,size: 60,color: kiconColor,),),
              SizedBox(width: 30,),
              Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                Text('Withdraw', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ],
              )
            ],),),
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                   color: Color(0xffffcdd2),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
                height: 50,
               
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextField(
                  
                  controller: amountcontroller,
                  decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                    hintText: 'Enter the amount',
                    icon: Icon(Icons.account_balance_wallet_sharp,size: 30,color: Colors.red,),
                    
  )
),
                ),
              ),
            ),
            SizedBox(height: 30),
             Padding(
              padding: const EdgeInsets.only(left: 25.0,right: 25),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                   color: Color(0xffffcdd2),
                  borderRadius: BorderRadius.all(Radius.circular(6))),
                height: 50,
               
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                  controller: phncontroller,
                  decoration: InputDecoration(hintText: 'Enter your esewa ID NO.',
                    icon: Icon(Icons.phone,size: 30,color: Colors.red,),
                    
  )
),
                ),
              ),
            ),
            SizedBox(height: 60),
            Container(height:50,width:150,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                     boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(3, 7), // changes position of shadow
                                  ),]
                      ),
                      child: RaisedButton(
                        
                        color: Colors.black,
                        onPressed: (){
                          if(Get.find<UserController>().user.currentbalance >= int.parse(amountcontroller.text)){
                          Get.find<MatchController>().withdrawRequest(int.parse(amountcontroller.text), int.parse(phncontroller.text));
                          Get.find<UserController>().updateBalannce(int.parse(amountcontroller.text), Get.find<UserController>().user.id);
                          Navigator.pop(context);}
                          else{
                            Get.snackbar('Sorry!', 'You have request more amount than your balance',snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.black);
                          }
                        },
                        child: Text('Request Withdraw',style: TextStyle(color: Colors.white),),),
            )
          
          ],

        ),
      ),
    );
  }
}