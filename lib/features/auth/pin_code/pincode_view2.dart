import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'pincode_cubit.dart';

class Pincode2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => PincodeCubit(),
      child: Scaffold(
      // final cubit = BlocProvider.of<PincodeCubit>(context);

        body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 11),
                  child: ListView(
                      children: [
                        CustomAuthenticationHeader(),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Please check your email at".tr(),
                              style: TextStyle(color: AppStyle.lightBlackColor, fontSize: 16),),
                            Text("michelle.rivera@gmail.com",style: TextStyle(color: AppStyle.primaryColor, fontSize: 16,fontWeight: FontWeight.bold),),
                            Text("to receive the password reset code.Kindly enter the code below to proceed.".tr(),style: TextStyle(color: AppStyle.lightBlackColor, fontSize: 16),)



                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Image.asset(
                          "assets/images/Lock Open 5.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20,),
                        PinCodeTextField(
                          length: 5,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            selectedFillColor: AppStyle.primaryColor.withOpacity(.7),
                            inactiveFillColor: Colors.grey.withOpacity(0.1),
                            inactiveColor: AppStyle.greyColor,
                            activeColor: AppStyle.greyColor,
                            shape: PinCodeFieldShape.circle,
                            borderRadius: BorderRadius.circular(25),
                            fieldHeight: 50,
                            fieldWidth: 50,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill: true,
                          // errorAnimationController: errorController,
                          // controller: textEditingController,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            return true;
                          }, appContext: context,
                        ),
                        SizedBox(height: 20,),
                        CustomButton(
                          title: 'Confirm'.tr(),
                          function: () => {
                          },bgColor: AppStyle.primaryColor,
                          textColor: Colors.white,

                        ),
                        SizedBox(height: 20,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child:  Text(
                                "Resend Code ?".tr(),
                                style: TextStyle(
                                    color: AppStyle.primaryColor,
                                    fontSize: 15,
                                    decoration: TextDecoration.underline),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),

                      ]
                  )
              )
          )
      )
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<PincodeCubit>(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 11),
                child: ListView(
                    children: [
                      CustomAuthenticationHeader(),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Please check your email at".tr(),
                            style: TextStyle(color: AppStyle.lightBlackColor, fontSize: 16),),
                          Text("michelle.rivera@gmail.com",style: TextStyle(color: AppStyle.primaryColor, fontSize: 16,fontWeight: FontWeight.bold),),
                          Text("to receive the password reset code.Kindly enter the code below to proceed.".tr(),style: TextStyle(color: AppStyle.lightBlackColor, fontSize: 16),)



                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        "assets/images/Lock Open 5.png",
                        height: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 20,),
                      PinCodeTextField(
                        length: 5,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          selectedFillColor: AppStyle.primaryColor.withOpacity(.7),
                          inactiveFillColor: Colors.grey.withOpacity(0.1),
                          inactiveColor: AppStyle.greyColor,
                          activeColor: AppStyle.greyColor,
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(25),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                        ),
                        animationDuration: Duration(milliseconds: 300),
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        // controller: textEditingController,
                        onCompleted: (v) {
                          print("Completed");
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          return true;
                        }, appContext: context,
                      ),
                      SizedBox(height: 20,),
                      CustomButton(
                        title: 'Confirm'.tr(),
                        function: () => {
                        },bgColor: AppStyle.primaryColor,
                        textColor: Colors.white,

                      ),
                      SizedBox(height: 20,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            child:  Text(
                              "Resend Code ?".tr(),
                              style: TextStyle(
                                  color: AppStyle.primaryColor,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),

                    ]
                )
            )
        )
    );
  }
}