import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WinnerSelector extends StatelessWidget {
  const WinnerSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datecontroller = TextEditingController();
    final winnercontroller = TextEditingController();
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                width: double.infinity,
                child: TextField(
                  controller: datecontroller,
                  decoration: InputDecoration(hintText: 'Enter the date in YY-MM-DD'),
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                width: double.infinity,
                child: TextField(
                  controller: winnercontroller,
                  decoration: InputDecoration(hintText: 'Enter the name of Wining team'),
                  
                ),
              ),
            ),
             OutlineButton(
              child: Text('Declare Winner', style: TextStyle(color: Colors.black,fontSize: 10),),
              onPressed: (){
                 FirebaseFirestore.instance
                  .collection('bets').doc(datecontroller.text).collection('todaybets')
                  .get()
                  .then((QuerySnapshot querySnapshot) => {
                      querySnapshot.docs.forEach((doc)async {
                         
                          
                          if(doc.data()['team1']== winnercontroller.text){
                                    int currentbalance;
                                    int team1win;
                                    int team2lose;
                                  await  FirebaseFirestore.instance.collection('users').doc(doc.data()['team1uid']).get().then((value) { 
                                  currentbalance = value.data()['balance'];
                                  team1win = value.data()['win'];
                                   } );
                                   await  FirebaseFirestore.instance.collection('users').doc(doc.data()['team2uid']).get().then((value) { 
                                  currentbalance = value.data()['balance'];
                                  team2lose = value.data()['lose'];
                                   } );

                             await  FirebaseFirestore.instance.collection('users')
                                .doc(doc.data()['team1uid'])
                                .update({
                                  
                                  'balance': currentbalance+(2*doc.data()['Amount']),
                                  'win': team1win+1,
           
                                });
                               await FirebaseFirestore.instance.collection('users')
                                .doc(doc.data()['team2uid'])
                                .update({
                                  'lose': team2lose+1,
           
                                });
                                 FirebaseFirestore.instance.collection('bets').doc(datecontroller.text).update({
                                  'Status': 'completed'
                                });
                                Get.snackbar('Successfull', 'You have declare winner as ${doc.data()['team1']}');

                           }else if(doc.data()['team2']== winnercontroller.text){
                               int currentbalance;
                                    int team2win;
                                    int team1lose;
                                  await  FirebaseFirestore.instance.collection('users').doc(doc.data()['team2uid']).get().then((value) { 
                                  currentbalance = value.data()['balance'];
                                  team2win = value.data()['win'];
                                   } );
                                    await  FirebaseFirestore.instance.collection('users').doc(doc.data()['team2uid']).get().then((value) { 
                                  currentbalance = value.data()['balance'];
                                  team1lose = value.data()['lose'];
                                   } );
                             await FirebaseFirestore.instance.collection('users')
                                .doc(doc.data()['team2uid'])
                                .update({
                                  
                                  'balance': currentbalance+(2*doc.data()['Amount']),
                                  'win': team2win+1,
           
                                });
                                await  FirebaseFirestore.instance.collection('users')
                                .doc(doc.data()['team1uid'])
                                .update({
                                  'lose': team1lose+1,
           
                                });
                               await FirebaseFirestore.instance.collection('bets').doc(datecontroller.text).update({
                                  'Status': 'completed'
                                });
                                 Get.snackbar('Successfull', 'You have declare winner as ${doc.data()['team2']}');
                                }
                      }),
                    }).catchError((error)=> Get.snackbar('Error',error));
             },
              color: Colors.black,
              borderSide: BorderSide(color: Colors.black),
            
            )

        ],),

      ),
    );
  }
}