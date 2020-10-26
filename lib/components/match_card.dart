import 'package:flutter/material.dart';

class Match extends StatelessWidget {
  final int matchNo;
  final String matchDate;
  final String team1;
  final String team2;
  final String team2logo;
  final String team1logo;
  final String venue;
  Match({this.matchNo, this.matchDate, this.team1, this.team2, this.venue,this.team1logo,this.team2logo});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Container(
        height: 120,

        decoration: BoxDecoration(
          boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(6, 4), // changes position of shadow
              ),
           ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfffafafa),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Match No:23  ',style: TextStyle(fontSize: 14,color: Colors.black),),

                    Text('$team1 vs $team2',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                    Text(matchDate,style: TextStyle(fontSize: 12,color: Colors.black),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5.0,bottom: 6),
              child: Container(height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        height: 50,
                        width: 80,

                        child: Image.network(team1logo)),
                    Text('VS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    Container(
                        height: 50,
                        width: 80,

                        child: Image.network(team2logo)),

                  ],
                ),
              ),
            ),

            Container(child: Center(child: Text('Venue: $venue', style: TextStyle(fontSize: 10,color: Colors.black54),)),)
          ],
        ),
      ),
    );
  }
}

