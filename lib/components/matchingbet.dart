
import 'package:flutter/material.dart';

class Matching extends StatelessWidget {
  final String team1player;
  final String team2player;
  final int amount;
  Matching({this.team1player, this.team2player,this.amount});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.3),
                      spreadRadius: 7,
                      blurRadius: 9,
                      offset: Offset(3, 5), // changes position of shadow
                    ),],
            color: Color(0xffFC3939),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 23,
              decoration: BoxDecoration(
                  
                  color: Color(0xffFC3939),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
              ),
              child:  Padding(
                padding: const EdgeInsets.only(left:35.0, right: 60),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status: Beted',textAlign: TextAlign.left,style: TextStyle(fontSize: 12,color: Colors.white),),
                   
                    Text('Rs. ${amount.toString()}',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.white),),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(team1player, style: TextStyle(fontSize: 16,color: Colors.white),),
                  Text('VS', style: TextStyle(fontSize: 18,color: Colors.white),),
                  Text(team2player, style: TextStyle(fontSize: 16, color: Colors.white),),
                ],


              ),


            ),
          ],
        ),
      ),
    );
  }
}
