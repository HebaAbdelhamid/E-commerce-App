import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/styles.dart';

class AppLanguage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            color: Colors.grey.withOpacity(.2)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("App Language",
                style: TextStyle(
                    color: AppStyle.blackColor,
                    fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 5,),
              Text("Choose your preference App Language",
                style: TextStyle(
                    color: Color(0XFFA2A2A3),
                    fontWeight: FontWeight.bold,fontSize: 13),),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 60,
        child: ListTile(
          leading:Image.asset("assets/images/Saudi Arabia (SA).png",width: 22,) ,
          title: Text(
            "Arabic",
            style: TextStyle(
                fontSize: 15,
                color: AppStyle.blackColor,
                fontWeight: FontWeight.bold),
          ),
          trailing: Image.asset("assets/images/images.png",width: 22,) ,
        ),
      ),
      // CustomListTilePayment(image: 'Saudi Arabia (SA).png', title: 'ttttttttt',)
    ],
  );
  }

}