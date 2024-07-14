import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/contact_as/contact_as_state.dart';
import 'package:yiki1/utils/utils.dart';

import 'contact_as_cubit.dart';

class Contact_asPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Contact_asCubit(),
      child: Scaffold(
        body:BlocBuilder<Contact_asCubit, Contact_asState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<Contact_asCubit>(context);
    return Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
          child: ListView(
            children: [
              CustomAuthenticationHeader(),
              SizedBox(
                height: 10,
              ),
               Text(
                "Contact Us".tr(),
                style: TextStyle(
                    color: AppStyle.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 13,
              ),
               Text(
                "Don’t hastate to contacts us anytime .".tr(),
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
                controller: cubit.name,
                keyboardType: TextInputType.emailAddress,
                // validator: (value) => Validate.vaidateEmail(value),

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
                // validator: (value) => Validate.vaidateEmail(value),

              ),
              CustomTextField(
                upperText: 'Your Message'.tr(),
                radius: 5,
                isNext: true,
                prefixIcon: Padding(
                  padding:
                  const EdgeInsets.only(left: 19.0, right: 7),
                  child: SvgPicture.asset('assets/images/Vector1.svg'),
                ),
                hint: 'Type your message here ...'.tr(),
                hintColor: AppStyle.greyColor,
                controller: cubit.message,
                keyboardType: TextInputType.emailAddress,
                // validator: (value) => Validate.vaidateEmail(value),

              ),
              SizedBox(height: 17,),

              CustomButton(
                title: "Send".tr(),
                function: () {
                  cubit.addContactUsMethods();
                  Utils.showSnackBar("تم ارسال الرساله بنجاح ");
                  // MagicRouter.navigateTo(BottonNavigationBarPage());
                },
                bgColor: AppStyle.primaryColor,
                textColor: Colors.white,
              ),
              ListTile(
                leading: Image.asset("assets/images/Phone Calling Rounded.png"),
                title: Text(
                  "Contact Us".tr(),
                  style: TextStyle(
                      color: Color(0XFFA2A2A3),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle:Text(
                  "050225123 - 0123456789 - 01123456789.",
                  style: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ) ,
              ),
              ListTile(
                leading: Image.asset("assets/images/MailMail.png",),
                title: Text(
                  "Email Address".tr(),
                  style: TextStyle(
                      color: Color(0XFFA2A2A3),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle:Text(
                  "info@Yukimagic.com",
                  style: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ) ,
              ),
              SizedBox(height: 11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Whatsapp ic.png",fit: BoxFit.cover,width: 31,),SizedBox(width: 7,),
                  Image.asset("assets/images/linkedin.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/youtube.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/instagram.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/facebook.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/X.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/Group 1000000926.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/Snapchat.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),
                  Image.asset("assets/images/tiktok.png",fit: BoxFit.cover,width: 31),SizedBox(width: 7,),


                ],
              ),
              SizedBox(height: 23,),
              //X.png

              //Mail.png

            ],
          ),
        );
  },
) ,
      )
    );
  }


}


