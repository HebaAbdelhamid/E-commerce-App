import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/utils/utils.dart';

import 'shared_applicaton_cubit.dart';
import 'shared_applicaton_state.dart';

class Shared_ApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Shared_applicatonCubit(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.grey.withOpacity(.2)),
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Share The App".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Share the application with your frinds".tr(),
                      style: TextStyle(
                          color: Color(0XFFA2A2A3),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset(
                "assets/images/Group 4532.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(children: [

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CustomTextField(
                      isReadOnly: true,
                      radius: 5,
                      isNext: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 19.0, right: 7),
                        child: Image.asset("assets/images/Ticket Sale.png"),
                      ),
                      initialValue: "http://play.google.com/store/".tr(),
                      lableText: 'http://play.google.com/store/'.tr(),
                      labelColor: AppStyle.greyColor,
                      // controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Expanded(
                      child: Container(
                          width: 74,
                          height: 45,
                          decoration: BoxDecoration(
                              color: AppStyle.primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                              child: Text(
                                "Copy link".tr(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )))),
                ],
              ),
              SizedBox(height: 13,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Whatsapp ic.png",fit: BoxFit.cover,),SizedBox(width: 7,),
                  Image.asset("assets/images/linkedin.png",fit: BoxFit.cover,),SizedBox(width: 7,),
                  Image.asset("assets/images/youtube.png",fit: BoxFit.cover,),SizedBox(width: 7,),
                  Image.asset("assets/images/instagram.png",fit: BoxFit.cover,),SizedBox(width: 7,),
                  Image.asset("assets/images/facebook.png",fit: BoxFit.cover,),SizedBox(width: 7,),


                ],
              ),
              SizedBox(height: 23,),

              CustomButton(title: "Back".tr(), function: (){
                // Utils.showBottonSheetChangePaaword(context);
              },bgColor: Colors.white,textColor: AppStyle.primaryColor,),
              SizedBox(height: 17,),



              // CustomListTilePayment(image: 'Saudi Arabia (SA).png', title: 'ttttttttt',)
                        ],
                      ),
            )]));
  }
}
