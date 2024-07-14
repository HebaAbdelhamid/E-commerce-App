import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/account_setting/account_setting_cubit.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    super.key,
    this.cubit,
  });

  final AccountSettingCubit ?cubit;

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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Change Password".tr(),
                          style: TextStyle(
                              color: AppStyle.blackColor,
                              fontWeight: FontWeight.bold,fontSize: 15),),
                        SizedBox(height: 5,),
                        Text("Do you want to change your password ?".tr(),
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
                            upperText: 'New Password'.tr(),
                            radius: 5,
                            isNext: true,
                            prefixIcon: Padding(
                              padding:
                              const EdgeInsets.only(left: 13.0, right: 5),
                              child: SvgPicture.asset('assets/images/Path 8.svg'),
                            ),
                            hint: 'Password'.tr(),
                            secure: true,
                            controller: cubit!.password,
                            keyboardType: TextInputType.visiblePassword,
                            // validator: (value) =>
                            // Validate.validatePassword(value),
                          ),
                          CustomTextField(
                            upperText: 'New Password Confirmation'.tr(),
                            radius: 5,
                            isNext: true,
                            prefixIcon: Padding(
                              padding:
                              const EdgeInsets.only(left: 13.0, right: 5),
                              child: SvgPicture.asset('assets/images/Path 8.svg'),
                            ),
                            hint: 'Password Confirmation'.tr(),
                            secure: true,
                            // controller: cubit.confirmpassword,
                            keyboardType: TextInputType.visiblePassword,
                            // validator: (value) =>
                            // Validate.validatePassword(value),
                          ),
                          SizedBox(height: 11,),
                          CustomButton(title: "Confirm".tr(), function: (){
                            cubit!.updatePassword();
                            MagicRouter.pop();
                          },bgColor: AppStyle.primaryColor,
                            textColor: Colors.white,
                          ),
                        ]))
              ]),]
    );
  }
}
