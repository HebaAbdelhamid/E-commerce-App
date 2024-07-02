import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

class Chargeyourwallet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return ListView(
     children:[
       Column(
          mainAxisSize: MainAxisSize.min,
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
                    Text("Charge your wallet",
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,fontSize: 15),),
                    SizedBox(height: 5,),
                    Text("Charge your wallet now",
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

                      CustomTextField(
                        upperText: 'value'.tr(),
                        radius: 5,
                        isNext: true,

                        hint: 'Enter charging value ...'.tr(),

                        // controller: cubit.password,
                        keyboardType: TextInputType.visiblePassword,
                        // validator: (value) =>
                        // Validate.validatePassword(value),
                      ),

                      SizedBox(height: 11,),
                      CustomButton(title: "Continue".tr(), function: (){
                        MagicRouter.pop();
                      },bgColor: AppStyle.primaryColor,
                        textColor: Colors.white,
                      ),
                    ]))
          ]),]
   );
  }

}