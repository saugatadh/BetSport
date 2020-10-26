import 'package:flutter/material.dart';
import 'package:betipl/constants.dart';

class ScreenLayout extends StatelessWidget {
  final Widget title;
  final Widget child;
  ScreenLayout({Key key,this.title,this.child}): super(key: key);


  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;

    const Color topColor = ktopColor;
    const Color backgroundColor= kbackgroundColor;

    return Column(
        children: <Widget>[
    Container(
      color: backgroundColor,
      child: Stack(
        children: <Widget>[

          Column(
            children: <Widget>[
              Container(
                height:100,
                width:widthOfScreen,
                decoration: BoxDecoration(
                  color: topColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40),),
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(color: backgroundColor,),
              ),
            ],
          ),
          Positioned(
            top: 30,
            right: 30,
            left: 30,

            child: Container(
                height: 100,

                decoration: BoxDecoration(
                  boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(3, 5), // changes position of shadow
                              ),
                            ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:title,
            ),
          ),

        ],
        overflow: Overflow.visible,
      ),
    ),
    Expanded(

      child: Container(
          width: widthOfScreen,
          decoration: BoxDecoration(
              color: Color(0xffECF0F9),

          ),
          child:child,
      ),
    ),


        ],
      ) ;
  }
}
