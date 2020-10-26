import 'package:flutter/material.dart';
import 'package:betipl/components/screenl_layout.dart';
import 'package:betipl/constants.dart';

class Topup extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayout(
        title:  Container(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Icon(Icons.account_balance_wallet,size: 60,color: kiconColor,),),
            SizedBox(width: 30,),
            Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
              Text('Top up', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],
            )
          ],),),
        child: Padding(
          padding: EdgeInsets.all(20),
          child:  RichText(
                  
                  textAlign: TextAlign.left,
                  text:TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: 'How can I Load money to my account?\n\n',style: TextStyle(fontSize: 18, color: Colors.red)),
                    
                    TextSpan(text: 'Step 1 : Open Your Esewa app with verified user logged IN\n\nStep 2 : Tap on Send money\n\nStep 3 : Enter the amount to topup \n\nStep 4 : Write your email Id and Your name in Remark Section\n\nStep 5 : Transfer the money to ',style: TextStyle(fontSize: 16)),
                
                  
                    TextSpan(text: ' 9845965166 \n\n',style: TextStyle(color: Colors.green,fontSize: 20, )),
                    TextSpan(text: 'Step 6 : Confirm the payment and you will receive the balance with in few hours', style: TextStyle(fontSize: 16)),
               

                  ]
                ),) ,),
        ),
      

      );
    
  }
}
