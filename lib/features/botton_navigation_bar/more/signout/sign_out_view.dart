import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/dio_helper/dio_helper.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/auth/login/view.dart';

import 'sign_out_cubit.dart';
import 'sign_out_state.dart';

class Sign_outPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Sign_outCubit(),
      child: BlocBuilder<Sign_outCubit, Sign_outState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<Sign_outCubit>(context);
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset(
        "assets/images/Exit.png",
        fit: BoxFit.cover,
            ),
          ),
           Text(
            "Signout".tr(),
            style: TextStyle(
                color: AppStyle.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 13,
          ),
           Text(
            "Do you want to signout of your account ?".tr(),
            style: TextStyle(
                color: Color(0XFFA2A2A3),
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Container(
              //     width:MediaQuery.of(context).size.width*.3,child: CustomButton(title: "Back", function: (){}, bgColor: AppStyle.primaryColor, textColor: Colors.white)),
              // Container(
              //   width: MediaQuery.of(context).size.width*.3,
              //     child: CustomButton(title: "Back", function: (){}, bgColor: Colors.white, textColor: AppStyle.redColor)),

              InkWell(
                onTap: (){
                  MagicRouter.pop();
                },
                child:
                CustomCategoryName(width: MediaQuery.of(context).size.width*.3, text: 'Back'.tr(), color1: AppStyle.primaryColor,color2:Colors.white ,
                ),
              ),
              InkWell(
                onTap: (){
                  cubit.signOut();
                  MagicRouter.navigateAndPopAll(LoginPage());
                },
                child: CustomCategoryName(width: MediaQuery.of(context).size.width*.3, text: 'Signout'.tr(), color1: Colors.white,color2:AppStyle.redColor ,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 13,
          ),

        ],
        ),
      );
  },
)
    );
  }


}


