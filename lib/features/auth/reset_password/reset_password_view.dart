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
import 'package:yiki1/features/auth/pin_code/pincode_view.dart';
import 'package:yiki1/features/auth/reset_password2/reset_password2_view.dart';
import 'package:yiki1/utils/utils.dart';

import 'reset_password_cubit.dart';
import 'reset_password_state.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResetPasswordCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0, vertical: 11),
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
                  "Kindly enter the email address linked to your account. "
                      "We'll immediately send you an email with a code to"
                      " reset your password".tr(),
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
                  upperText: 'Email Address'.tr(),
                  radius: 5,
                  isNext: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 19.0, right: 7),
                    child: SvgPicture.asset('assets/images/Vector.svg'),
                  ),
                  hint: 'Email Address'.tr(),
                  hintColor: AppStyle.greyColor,
                  // controller: controller.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validate.vaidateEmail(value),
                ),
                SizedBox(height: 28,),
                CustomButton(
                  title: 'Confirm'.tr(),
                  function: () => {
                    // Utils.verifyAccount2(context)
                    MagicRouter.navigateTo(PincodePage())


                  },
                    bgColor: AppStyle.primaryColor,
                  textColor: Colors.white,

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}



