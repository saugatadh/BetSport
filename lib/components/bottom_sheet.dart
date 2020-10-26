import 'package:betipl/controller/matchcontroller.dart';
import 'package:betipl/controller/usercontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomSheet extends StatefulWidget {
  
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
      String dropdownValue ;
  @override
  Widget build(BuildContext context) {
   
 
     final amountController = TextEditingController();
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(10))
      ),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
          children: [
         
          Row(
            
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
              Text('Select Team : ',style: TextStyle(fontSize: 18,color: Colors.white),),
              SizedBox(width: 30),
                DropdownButton<String>(
                  dropdownColor: Colors.black,
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    focusColor: Colors.black,
                    style: TextStyle(
                      
                      color: Colors.white),
                    // underline: Container(
                    //   height: 1,
                    //   color: Colors.white,
                    // ),
                    onChanged: (String newValue) {
                          setState(() { dropdownValue = newValue; 
                          });
                         
                    },
                    items: <String>[Get.find<MatchController>().team1.toString(), Get.find<MatchController>().team2.toString()]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              
                ),
            
              
          ],),
          
          Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Amount(RS.) : ', style:TextStyle(color: Colors.white,fontSize: 16)),
            SizedBox(width:20),
            Container(
              height: 30,
              width: 100,
              decoration:BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,fontSize: 18),
                
                  
                  
                ),
            ),

          ],
          )

            ,OutlineButton(

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('Request',style: TextStyle(fontSize: 18,color: Colors.white),),
                    ),
                    onPressed: () {
                      if(Get.find<UserController>().user.currentbalance >= int.parse(amountController.text)){
                        dropdownValue == Get.find<MatchController>().team1.toString()? Get.find<MatchController>().team1Request(dropdownValue, int.parse(amountController.text)):
                        Get.find<MatchController>().team2Request(dropdownValue, int.parse(amountController.text));
                        
                        Navigator.pop(context);
                        Get.snackbar("Requested","Your request was successfully added",snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.black );
                      }else{
                        Get.snackbar("Sorry","You Dont have enough balance to request",snackPosition: SnackPosition.BOTTOM,colorText: Colors.white,backgroundColor: Colors.black );
                      }

                    }, //callback when button is clicked
                    borderSide: BorderSide(
                      color: Colors.white, //Color of the border
                      style: BorderStyle.solid, //Style of the border
                      width:2,
                      //width of the border
                    ),
                  ),         
        
        ],) ,


    );
  }
}
