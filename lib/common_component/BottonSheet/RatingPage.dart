import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate/rate.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

class RatingPage extends StatelessWidget{
  RatingPage({this.value_, this.messsage});
 var value_;
var messsage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            height: 17,
          ),
          Text(
            "Rate Order".tr(),
            style: TextStyle(
                color: AppStyle.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 17),textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Share your experince with us".tr(),
            style: TextStyle(
                color: Color(0XFFA2A2A3),
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
          SizedBox(
            height: 17,
          ),
          Rate(
            iconSize: 40,
            color: Color(0xffFFD700),
            allowHalf: true,
            allowClear: true,
            initialValue: 3.5,
            readOnly: false,
            onChange: (value) {
              value_=value;
              print(value);
              },
          ),
          SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: CustomTextField(
              multiLine: true,
              radius: 5,
              isNext: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 19.0, right: 7),
                child: SvgPicture.asset('assets/images/Vector1.svg'),
              ),
              hint: 'Write message here ...'.tr(),
              hintColor: AppStyle.greyColor,
              controller: messsage,
              keyboardType: TextInputType.emailAddress,
              // validator: (value) => Validate.vaidateEmail(value),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap:(){

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .37,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppStyle.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rate ".tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),  InkWell(
                onTap:(){
                  MagicRouter.pop();

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .37,
                  height: 40,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5),border: Border.all(color: AppStyle.primaryColor )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Back".tr(),
                        style: TextStyle(
                            color:  AppStyle.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 17,
          ),

          // Text(
          //   "Share Us Your Review ",
          //   textAlign: TextAlign.start,
          //   style: TextStyle(
          //       color: AppStyle.blackColor,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 17),
          // ),




        ],
      ),
    );
  }
}
