import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

class Loyaltypoints extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.grey.withOpacity(.2)),
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Convert Loyalty Points".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 5,),
                  Text("Convert loyalty points to wallet balcnce".tr(),
                    style: TextStyle(
                        color: Color(0XFFA2A2A3),
                        fontWeight: FontWeight.bold,fontSize: 13),),
                ],
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 11),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("Total Loyalty Poitns".tr(),
      style: TextStyle(

            color: Color(0XFFA2A2A3),
            fontWeight: FontWeight.bold,fontSize: 15),),
              // color: AppStyle.blackColor,
              // fontWeight: FontWeight.bold,fontSize: 15)
    SizedBox(height: 5,),
    Text("10000 Loyalty point".tr(),
      style: TextStyle(
        color: AppStyle.blackColor,
        fontWeight: FontWeight.bold,fontSize: 17)
         ),
  ],

),

                    SizedBox(height: 11,),
                    CustomButton(title: "Convert to wallet balance".tr(), function: (){
                      MagicRouter.pop();
                    },bgColor: AppStyle.primaryColor,
                      textColor: Colors.white,
                    ),
                  ]))
        ]);
  }

}