import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:yiki1/common_component/BottonSheet/ChangePasswordBottonSheet.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/core/validate.dart';
import 'package:yiki1/features/botton_navigation_bar/more/account_setting/account_setting_state.dart';

import '../../../../utils/utils.dart';
import 'account_setting_cubit.dart';

class Account_settingPage extends StatelessWidget {
  // late File _image;
  // final picker = ImagePicker();
  // imagePicker() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     _image = File(pickedFile.path);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AccountSettingCubit(),
        child: BlocBuilder<AccountSettingCubit, Account_settingState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<AccountSettingCubit>(context);
            return Scaffold(
                body: Padding(
              padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
              child: ListView(
                children: [
                  CustomAuthenticationHeader(),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Account Settings".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Control your account settings".tr(),
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
                  Center(
                    child: Stack(alignment: Alignment.bottomRight, children: [
                      Image.asset(
                        "assets/images/Rectangle 1885.png",
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          bottom: 88,
                          right: 22,
                          child: GestureDetector(
                            onTap: () {
                              cubit.imagePicker();
                            },
                            child: Image.asset(
                              "assets/images/Group 7410 (1).png",
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ]),
                  ),
                  CustomTextField(
                    upperText: 'Name'.tr(),
                    radius: 5,
                    isNext: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 7),
                      child: Icon(
                        Icons.person_2_outlined,
                        color: AppStyle.greyColor,
                      ),
                    ),
                    hint: 'Name'.tr(),
                    hintColor: AppStyle.greyColor,
                    controller: cubit.name,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) => Validate.vaidateEmail(value),
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
                    controller: cubit.email,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) => Validate.vaidateEmail(value),
                  ),
                  CustomTextField(
                    upperText: 'Phone Number'.tr(),

                    radius: 5,
                    prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 19.0, right: 7),
                        child: Container(
                          height: 30,
                          child: IntlPhoneField(
                            controller: cubit.phone,
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
                  const Text(
                    "Link Personal account",
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Google.svg",
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 7),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 13,
                              color: AppStyle.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Connected",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xff20CA38),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Info@gmail.com",
                        style: TextStyle(
                            color: Color(0XFFA2A2A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Switch(
                          activeTrackColor: Color(0xff20CA38),
                          activeColor: Colors.white,
                          value: true,
                          onChanged: (value) {})
                    ],
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  CustomButton(
                    title: "Change Password".tr(),
                    function: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ChangePassword(cubit: cubit);
                          });
                      // Utils.showBottonSheetChangePaaword(context);
                    },
                    bgColor: Colors.white,
                    textColor: AppStyle.primaryColor,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  CustomButton(
                    title: "Save Changes".tr(),
                    function: () {
                      cubit.updateProfile();
                    },
                    bgColor: AppStyle.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                ],
              ),
            ));
          },
        ));
  }
}
