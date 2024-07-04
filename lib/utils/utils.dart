import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/BottonSheet/ChangePasswordBottonSheet.dart';
import 'package:yiki1/common_component/BottonSheet/botton_sheet_productDetails.dart';
import 'package:yiki1/common_component/pop_up.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

import '../features/botton_navigation_bar/more/account_setting/account_setting_view.dart';

abstract class Utils {
  static void showSnackBar(text) {
    ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(text),
      ),
    );
  }

  static void resetPassword(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: PopupCardDetails(
              text1: "Reset Code has been sent to your Email at".tr(),
              text2: "michelle.rivera@gmail.com".tr(),
              text1Color: AppStyle.lightBlackColor,
              text2Color: AppStyle.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  static void resetPassword2() async {
    showDialog(
        context: MagicRouter.currentContext,
        builder: (context) {
          return AlertDialog(
            content: PopupCardDetails(
              text1: "Your password has been successfully reset.".tr(),
              text2: "Congratulations".tr(),
              text1Color: AppStyle.lightBlackColor,
              text2Color: AppStyle.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  static void verifyAccount(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: PopupCardDetails2(
              text1: "Activation Code has been sent to your Email at ".tr(),
              text2: "michelle.rivera@gmail.com".tr(),
              text1Color: AppStyle.lightBlackColor,
              text2Color: AppStyle.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }

  static void verifyAccount2(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: PopupCardDetails3(
            text1:
                "Your account has been successfully activated! You will now be automatically redirected to the homepage."
                    .tr(),
            text2: "Congratulations".tr(),
            text1Color: AppStyle.lightBlackColor,
            text2Color: AppStyle.primaryColor,
            fontWeight: FontWeight.bold,
          ));
        });
  }

  static void showBottonSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return ProductDetailsBottonSheet();
        });
  }

  static void showBottonSheetChangePaaword(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ChangePasswordBottonSheet(),
          );
        });
  }

  static void completeOrder(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: PopupCardDetails3(
            text1:
                "Your order has been successfully placed and is now in review."
                    .tr(),
            text2: "Thank you for shopping with us".tr(),
            text1Color: AppStyle.lightBlackColor,
            text2Color: AppStyle.primaryColor,
            fontWeight: FontWeight.bold,
          ));
        });
  }

  static void returnOrder(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: PopupCardDetails(
              text1: "تم ارسال طلب الارجاع بنجاح",
              text2: "",
              text1Color: AppStyle.lightBlackColor,
              text2Color: AppStyle.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          );
        });
  }
}
