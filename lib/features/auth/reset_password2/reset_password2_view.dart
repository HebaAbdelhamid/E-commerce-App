import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/features/auth/login/view.dart';
import 'package:yiki1/features/auth/pin_code/pincode_view2.dart';

import 'reset_password2_cubit.dart';
import 'reset_password2_state.dart';

class ResetPassword2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Reset_password2Cubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
            child: ListView(
              children: [
                CustomAuthenticationHeader(),
                Text(
                  'Reset Your Password'.tr(),
                  style: TextStyle(color: AppStyle.blackColor, fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please enter a new password and confirm it to "
                      "complete the password reset process.".tr(),
                  style: TextStyle(color: AppStyle.lightBlackColor, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/2 501.png",
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.contain,
                ),
                CustomTextField(
                  upperText: 'Password'.tr(),
                  radius: 5,
                  isNext: true,
                  prefixIcon: Padding(
                    padding:
                    const EdgeInsets.only(left: 13.0, right: 5),
                    child: SvgPicture.asset('assets/images/Path 8.svg'),
                  ),
                  hint: 'Password'.tr(),
                  secure: true,
                  // controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) =>

                      Validate.validatePassword(value),
                ),
                CustomTextField(
                  upperText: 'Password Confirmation'.tr(),
                  radius: 5,
                  isNext: true,
                  prefixIcon: Padding(
                    padding:
                    const EdgeInsets.only(left: 13.0, right: 5),
                    child: SvgPicture.asset('assets/images/Path 8.svg'),
                  ),
                  hint: 'Password Confirmation'.tr(),
                  secure: true,
                  // controller: controller.password,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) =>

                      Validate.validatePassword(value),
                ),
                SizedBox(height: 28,),
                CustomButton(
                  title: 'Confirm'.tr(),
                  function: () => {
                    MagicRouter.navigateTo(LoginPage())

                  },bgColor: AppStyle.primaryColor,
                  textColor: Colors.white,

                ),
              ],
            ),
          ),
        ),
      )
    );
  }


}


