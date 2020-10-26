




import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
    String name;
    String id;
    String email;
    String phoneNo;
    int win;
    int lose;
    int currentbalance;
    String token;
    String post;

    UserModel({this.email, this.name, this.currentbalance, this.phoneNo, this.win, this.lose,this.id, this.token,this.post}){
      name = this.name;
      email = this.email;
      currentbalance = this.currentbalance;
      phoneNo = this.phoneNo;
      win = this.win;
      lose = this.lose;
      id = this.id;
      token = this.token;
      post= this.post;
      
    }
     UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot }) {
    id = documentSnapshot.data()["userId"];
    name = documentSnapshot.data()["name"];
    email = documentSnapshot.data()["email"];
    currentbalance = documentSnapshot.data()["balance"];
    win = documentSnapshot.data()["win"];
    lose = documentSnapshot.data()["loss"];
    phoneNo = documentSnapshot.data()["phoneNo"];
    token = documentSnapshot.data()["token"];
    post = documentSnapshot.data()["post"];
  }



  


}

