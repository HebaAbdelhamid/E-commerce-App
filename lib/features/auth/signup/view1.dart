import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yiki1/common_component/custom_Main_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_loading.dart';
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
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SingleChildScrollView(
              child: BlocBuilder<SignupCubit, SignUpSate>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<SignupCubit>(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomeHeader(),
                        CustomeMainHeader(
                          mainTitle: 'Create New Account'.tr(),
                          subTitle1: 'Already Have an account? '.tr(),
                          subTitle2: 'Login'.tr(),
                          function: () {
                            MagicRouter.navigateTo(LoginPage());
                          },
                        ),
                        CustomTextField(
                          upperText: 'Name'.tr(),
                          radius: 5,
                          isNext: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 19.0, right: 7),
                            child: Icon(
                              Icons.person_2_outlined,
                              color: AppStyle.greyColor,
                            ),
                          ),
                          hint: 'Name'.tr(),
                          hintColor: AppStyle.greyColor,
                          controller: cubit.name,
                          keyboardType: TextInputType.emailAddress,
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
                                  controller: cubit.phone,
                                  flagsButtonPadding: EdgeInsets.zero,
                                  flagsButtonMargin: EdgeInsets.zero,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  initialCountryCode: 'EG',
                                  onChanged: (phone) {
                                    cubit.phoneCode = phone.countryCode;
                                  },
                                ),
                              )
                              // Icon(Icons.person_2_outlined,color: AppStyle.greyColor,),
                              ),
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
                          controller: cubit.confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) =>
                              Validate.validatePassword(value),
                        ),
                        ListTile(
                          leading: Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                              shape: const CircleBorder(),
                              value: cubit.checkedValue,
                              onChanged: (newValue) {
                                cubit.checked(newValue);
                              },
                            ),
                          ),
                          title: GestureDetector(
                            onTap: (){
                              showModalBottomSheet(context: context, builder: (context){
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                                  child: ListView(children:  [
                                    SizedBox(height: 10),
                                    Text(
                                      "Terms & Conditions".tr(),
                                      style: TextStyle(
                                          color: AppStyle.blackColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      " Take a look at App terms and conditions".tr(),
                                      style: TextStyle(
                                          color: Color(0XFFA2A2A3),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Divider(
                                      color: AppStyle.primaryColor,
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    Text(
                                      " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborumLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                      style: TextStyle(
                                          color: AppStyle.lightBlack,
                                          fontSize: 13),
                                    ),

                                  ]),
                                );
                              });

                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "I agree to".tr(),
                                  style: const TextStyle(
                                    color: AppStyle.lightBlackColor,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Terms & Condition".tr(),
                                  style: const TextStyle(
                                    color: AppStyle.primaryColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),)
                              ],
                            ),
                          ),
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                        ),
                        state is SignupLoading
                            ? const CustomLoading()
                            : CustomButton(
                                title: 'Confirm'.tr(),
                                function: () => cubit.signUp(),
                                bgColor: AppStyle.primaryColor,
                                textColor: Colors.white,
                              ),
                        const SizedBox(height: 17)
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
