







import 'package:betipl/controller/usercontroller.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:betipl/components/team1_request.dart';
import 'package:betipl/components/team2_ request.dart';
import 'package:betipl/components/match_card.dart';
import 'package:betipl/components/matchingbet.dart';

class MatchController extends GetxController{
var todaydate = ''.obs.toString();
var team1logo = ''.obs;
var team2logo = ''.obs;
var team1 = ''.obs;
var team2 = ''.obs;
var date = ''.obs;
var venue = ''.obs;
var matchno = ''.obs;
@override
void onInit(){
  setDate();
  getTodaysMatch();
  super.onInit();
}
  void getTodaysMatch()async{
     try{
   await  FirebaseFirestore.instance.collection('bets').doc(todaydate).get().then((value){
     print(value.data());
     team1logo.value = value.data()['Team1logo'];
     team2logo.value = value.data()['Team2logo'];
     team1.value =  value.data()['Team1'];
     team2.value =  value.data()['Team2'];
     venue.value =  value.data()['Venue'];
     matchno.value = value.data()['MatchNo'];
    });}
    catch(e){
      print(e);
    }

  }
String getDate(){
     final DateTime now = DateTime.now();
   final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
    
  
 }


void setDate(){
     final DateTime now = DateTime.now();
   final DateFormat formatter = DateFormat('yyyy-MM-dd');
    todaydate = formatter.format(now);
    print(todaydate);
  
 }

CollectionReference bets = FirebaseFirestore.instance.collection('bets');
Future<void> team1Request(String team, int amount) {
                return bets
                  .doc(todaydate).collection('todaybets').doc(Get.find<UserController>().user.name.toString())
                  .set({
                    'name':Get.find<UserController>().user.name.toString(),
                    'team': team,
                    'Amount': amount,
                    'uid' : Get.find<UserController>().user.id,
                    'status': 'team1request'

                  })
                  .then((value) => print("User Added"))
                  .catchError((error) => print("Failed to add user: $error"));
              }


      Future<void> team2Request(String team, int amount) {
                return bets
                  .doc(todaydate).collection('todaybets').doc(Get.find<UserController>().user.name.toString())
                  .set({
                    'name':Get.find<UserController>().user.name.toString(),
                    'team': team,
                    'Amount': amount,
                    'uid' : Get.find<UserController>().user.id,
                    'status': 'team2request'
                  })
                  .then((value) => print("User Added"))
                  .catchError((error) => print("Failed to add user: $error"));
              }

      Future<void>matchingRequest(String team1player,String team2player, int amount, bool deleteteam1req,String team1uid, String team2uid) {
                bets
                  .doc(todaydate).collection('todaybets')
                  .add({
                    'team1': Get.find<MatchController>().team1.toString(),
                    'team1player': team1player,
                    'team1uid' : team1uid,
                    'team2': Get.find<MatchController>().team2.toString(),
                    'team2player': team2player,
                    'team2uid' : team2uid,
                    'Amount': amount,
                  
                  })
                  .then((value) => Get.snackbar('Successfull', 'You have successfully bet with $team2player',snackPosition: SnackPosition.BOTTOM,colorText: Colors.white))
                  .catchError((error) => print("Failed to add user: $error"));
                 return deleteteam1req== true ? FirebaseFirestore.instance.collection('bets').doc(todaydate).collection('todaybets').doc(team1player).delete():
                 FirebaseFirestore.instance.collection('bets').doc(todaydate).collection('todaybets').doc(team2player).delete();
                
              }






  Widget getMatches(){
    

      return StreamBuilder<QuerySnapshot>(
      stream:FirebaseFirestore.instance.collection('bets').where('Status' ,isEqualTo: 'coming').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return new ListView(
               shrinkWrap: true,
              children: snapshot.data.docs.map((DocumentSnapshot document) {
              
                return Match(team1: document.data()['Team1'],team2: document.data()['Team2'], team1logo: document.data()['Team1logo'],team2logo: document.data()['Team2logo'],venue: document.data()['Venue'], matchDate: document.data()['Date'], );
              }).toList(),
            );
      },
    );

 
  }


 Future<void> withdrawRequest(int amount, int phone) {
                return FirebaseFirestore.instance.collection('withdrawReq')
                  .doc(Get.find<UserController>().user.name.toString())
                  .set({
                    'name':Get.find<UserController>().user.name.toString(),
                    'Date': todaydate,
                    'Amount': amount,
                    'PhoneNo': phone,
                    'uid' : Get.find<UserController>().user.id,
                  })
                  .then((value) => print("User Added"))
                  .catchError((error) => print("Failed to add user: $error"));
              }


Widget getBetMatches(){
 return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('bets').doc(todaydate).collection('todaybets')
          .snapshots(),
      builder: (context, snapshot) {
             if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return new ListView(
               shrinkWrap: true,
              children: snapshot.data.docs.map((DocumentSnapshot document) {
              if(document.data()['status']=='team1request'){
                 return Team1request(team1player: document.data()['name'],amount: document.data()['Amount'], team1uid: document.data()['uid'],);}
             
             if(document.data()['status']=='team2request'){
                 return Team2Request(team2player: document.data()['name'],amount: document.data()['Amount'],team2uid: document.data()['uid'],);
             }else{
               return Matching(team1player: document.data()['team1player'], team2player: document.data()['team2player'],amount: document.data()['Amount']);
             }
             
             
              }).toList(),
            );
      },
    );

}

}