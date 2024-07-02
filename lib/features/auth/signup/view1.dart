import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yiki1/common_component/custom_Main_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/common_component/header.dart';
import 'package:yiki1/core/change_languge.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/features/auth/pin_code/pincode_view2.dart';
import '../../../utils/utils.dart';
import '../login/view.dart';
import 'cubit.dart';
import 'state.dart';

class SignupPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignupCubit(),
      child:Scaffold(
        // appBar: AppBar(
        //   actions: [
        //     Tooltip(
        //         message: "change_language".tr(),
        //         child: IconButton(
        //             onPressed: () {
        //               LocalizationChecker.changeLanguge(context);
        //             },
        //             icon: const Icon(Icons.language)))
        //   ],
        // ),
          body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SingleChildScrollView(
                      child:BlocBuilder<SignupCubit, SignUpSate>(
  builder: (context, state) {
    final cubit =BlocProvider.of<SignupCubit>(context);
    return Form(
                          key: cubit.formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomeHeader(),
                                CustomeMainHeader(
                                  mainTitle: 'Create New Account'.tr(),
                                  subTitle1: 'Already Have an account? '.tr(),
                                  subTitle2: 'Login'.tr(), function: () {
                                  MagicRouter.navigateTo(LoginPage());
                                },

                                ),
                                CustomTextField(
                                  upperText: 'Name'.tr(),
                                  radius: 5,
                                  isNext: true,
                                  prefixIcon: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 19.0, right: 7),
                                    child: Icon(Icons.person_2_outlined,color: AppStyle.greyColor,),
                                  ),
                                  hint: 'Name'.tr(),
                                  hintColor: AppStyle.greyColor,
                                  // controller: cubit.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => Validate.vaidateEmail(value),

                                ),

                                CustomTextField(
                                  upperText: 'Email Address'.tr(),
                                  radius: 5,
                                  isNext: true,
                                  prefixIcon: Padding(
                                    padding:
                                    const EdgeInsets.only(left: 19.0, right: 7),
                                    child: SvgPicture.asset('assets/images/Vector.svg'),
                                  ),
                                  hint: 'Email Address'.tr(),
                                  hintColor: AppStyle.greyColor,
                                  controller: cubit.email,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) => Validate.vaidateEmail(value),

                                ),
                                CustomTextField(
                                  upperText: 'Phone Number'.tr(),
                                  radius: 5,
                                  prefixIcon: Padding(
                                      padding:
                                      const EdgeInsets.only(left: 19.0, right: 7),
                                      child: Container(
                                        height: 30,
                                        child: IntlPhoneField(
                                          flagsButtonPadding: EdgeInsets.zero,
                                          flagsButtonMargin: EdgeInsets.zero,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,

                                            ),
                                          ),
                                          initialCountryCode: 'IN',
                                          onChanged: (phone) {
                                            print(phone.completeNumber);
                                          },
                                        ),
                                      )
                                    // Icon(Icons.person_2_outlined,color: AppStyle.greyColor,),
                                  ),
                                  // controller: controller.email,
                                  validator: (value) => Validate.vaidateEmail(value),

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
                                  controller: cubit.password,
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
                                  controller: cubit.confirmpassword,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) =>

                                      Validate.validatePassword(value),
                                ),
                                ListTile(
                                  leading: Transform.scale(
                                    scale: 1.4, // Adjust the scale as needed
                                    child: Checkbox(
                                      shape: CircleBorder(),
                                      value:cubit.checkedValue,
                                      onChanged: (newValue) {
                                      cubit.checked(newValue);
                                      },
                                    ),
                                  ),
                                  title: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "I agree to".tr(),
                                        style: TextStyle(
                                          color: AppStyle.lightBlackColor, // Replace with AppStyle.lightBlackColor
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        "Terms & Condition".tr(),
                                        style: TextStyle(
                                          color: AppStyle.primaryColor, // Replace with AppStyle.mainColor1
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.zero, // Remove padding between the checkbox and title
                                  horizontalTitleGap: 0,),
                                CustomButton(
                                  title: 'Confirm'.tr(),
                                  function: () {
                                    cubit.signUp();
                                    Utils.showSnackBar(context, cubit.signUp());
                                    if(state is SuccessSignUpState)
                                    MagicRouter.navigateTo(Pincode2Page());
                                  },bgColor: AppStyle.primaryColor,
                                  textColor: Colors.white,

                                ),
                                SizedBox(height: 17,)
                              ]));
  },
))))
      )
    );
  }

  
}


