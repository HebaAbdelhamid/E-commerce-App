import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/utils/utils.dart';

import 'return_order_reason_cubit.dart';
import 'return_order_reason_state.dart';

class ReturnOrderReasonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ReturnOrderReasonCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ReturnOrderReasonCubit, ReturnOrderReasonState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<ReturnOrderReasonCubit>(context);
              return Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const CustomHeader(),
                    const SizedBox(
                      height: 10,
                    ),
                     Text(
                      "Return Order".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    const Text(
                      "Order No. #1236582",
                      style: TextStyle(
                          color: Color(0XFFA2A2A3),
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    const Divider(
                      color: AppStyle.primaryColor,
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(17),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Order no. : ".tr(),
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const Text("#46679797",
                                    style: TextStyle(
                                        color: AppStyle.blackColor,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      .27,
                                ),
                                const Text("2500 EGP",
                                    style: TextStyle(
                                        color: AppStyle.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Order Status :  ".tr(),
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                const Text(" Delivered",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      .27,
                                ),
                              ],
                            ),
                            Text(
                              "Sunday , 12 Nov 2023  ",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                     Text(
                      "Choose Products you want to return".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartItem(
                          image: "Rectangle 12349.png",
                          title: "keratin Serum",
                          price: "360.00",
                          count: 2,
                        );
                      },
                      itemCount: 2,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 17,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.4),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                     Text(
                      "Return Reason"..tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    CustomTextField(
                      multiLine: true,
                      radius: 5,
                      isNext: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 19.0, right: 7),
                        child: SvgPicture.asset('assets/images/Vector1.svg'),
                      ),
                      hint: 'Mention the return reason'.tr(),
                      hintColor: AppStyle.greyColor,
                      // controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      // validator: (value) => Validate.vaidateEmail(value),
                    ),

                   const  SizedBox(
                      height: 13,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.4),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                     Text(
                      "Attach Image(s)".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      Image.asset("assets/images/Group 4375.png"),
                          Column(
                            children: [
                               Text("Attach image or more".tr(),style: TextStyle(color: AppStyle.blackColor,fontSize: 13),),
                              Text("Pdf , Png , Jpg , Jpeg",style: TextStyle(color: Colors.grey.withOpacity(.9),fontSize: 13),),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    CustomButton(
                      title: "Return ".tr(),
                      function: () {
Utils.returnOrder(context);                      },
                      bgColor: AppStyle.primaryColor,
                      textColor: Colors.white,
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height*.15,
                    //   child: ListView.separated(
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context,index){
                    //         return Container(
                    //           decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    //           child: Image.asset("assets/images/image11.png",width: MediaQuery.of(context).size.width*.4,fit: BoxFit.cover,),
                    //
                    //         );
                    //       }, separatorBuilder: (context,index){
                    //     return SizedBox(width: 7,);
                    //   }, itemCount: 7),
                    // )


                  ],
                ),
              );
            },
          ))
    );
  }


}


