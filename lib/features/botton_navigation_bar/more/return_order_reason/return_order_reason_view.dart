import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/models/orderModel.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/component/CartItem.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_order_details/return_order_details_view.dart';
import 'package:yiki1/utils/utils.dart';

import 'return_order_reason_cubit.dart';
import 'return_order_reason_state.dart';

class ReturnOrderReasonPage extends StatelessWidget {
  ReturnOrderReasonPage(this. item);
  Items item;
  @override
  Widget build(BuildContext context) {
    var quantity;
    var productId;
    var id;
    return BlocProvider(
      create: (BuildContext context) => ReturnOrderReasonCubit()..getDetailsOrders(item.id),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ReturnOrderReasonCubit, ReturnOrderReasonState>(
            builder: (context, state) {
               final cubit= BlocProvider.of<ReturnOrderReasonCubit>(context);

              return  state is LoadingState || cubit.orderDetailsResponse==null?CustomLoading():
               Padding(
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
                     Text(
                      "Order No.   #${item.id}",
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
                                 Text("#${item.id}",
                                    style: TextStyle(
                                        color: AppStyle.blackColor,
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: SizedBox(
                                    // width: MediaQuery.of(context).size.width *
                                    //     .27,
                                  ),
                                ),
                                 Text("${item.grandTotalAfterDeposit.toString()} EGP",
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
                                 Text(" ${item.status}",
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
                              "${item.date}  ",
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
                    // SizedBox(
                    //   height: 150,
                    //   child: ListView.separated(
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) {
                    //       return CartItem(
                    //         image: "Rectangle 12349.png",
                    //         title: "${cubit.orderDetailsResponse!.data!.items![index].productName??""}",
                    //         price: "${cubit.orderDetailsResponse!.data!.items![index].price??""}",
                    //         count: 9,
                    //         id: 1,
                    //       );
                    //     },
                    //     itemCount: cubit.orderDetailsResponse!.data!.items!.length??1,
                    //     separatorBuilder: (context, index) {
                    //       return const SizedBox(
                    //         height: 17,
                    //       );
                    //     },
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*.2,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var itemId =cubit.orderDetailsResponse!.data!.items![index].id;
                           quantity=cubit.orderDetailsResponse!.data!.items![index].quantity;
                           productId=cubit.orderDetailsResponse!.data!.items![index].productId;
                           id=cubit.orderDetailsResponse!.data!.items![index].id;
                          print(cubit.orderDetailsResponse!.data!.items![index].productId);
                          print(cubit.orderDetailsResponse!.data!.items![index].id);
                           return Row(
                            children: [
                              Container(
                                width:60,
                                height: 129,
                                decoration: BoxDecoration(
                                    color: AppStyle.primaryColor,
                                    borderRadius: BorderRadius.circular(7)),
                                child: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          if(cubit.getItemCount(itemId! )< cubit.orderDetailsResponse!.data!.items![index].quantity!.toInt())
                                          cubit.increament(itemId);

                                        },
                                        child: const Text(
                                          "+",
                                          style: TextStyle(fontSize: 20, color: Colors.white),
                                        )),
                                    Text(
                                      cubit.getItemCount(itemId! ).toString(),
                                      style: TextStyle(fontSize: 22, color: Colors.white),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          if(cubit.getItemCount(itemId )>1)
                                            cubit.decreament(itemId);

                                        },
                                        child: const Text(
                                          "-",
                                          style: TextStyle(fontSize: 24, color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  width: 10
                              ),
                              CartItem(
                                  image: "Rectangle 12349.png",
                                  title: "${cubit.orderDetailsResponse!.data!.items![index].productName??""}",
                                  price: "${cubit.orderDetailsResponse!.data!.items![index].price??""}",
                                  count: 9,
                                  id: 1,
                                ),]);
                        },
                        itemCount:1,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 17,
                          );
                        },
                      ),
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
                      style: const TextStyle(
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
                      controller: cubit.reason,
                      keyboardType: TextInputType.emailAddress,
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
                      style: const TextStyle(
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
                        // print(cubit.orderDetailsResponse!.data!.items![index].quantity);
                        // print(cubit.orderDetailsResponse!.data!.items![index].productId);
                        // print(cubit.orderDetailsResponse!.data!.items![index].id);
                        cubit.addReturnOrder(idOrder: item.id,idItem:id ,idProduct:productId ,quantity:quantity );
Utils.returnOrder(context);
// MagicRouter.navigateTo(ReturnOrderDetailsPage());

},
                      bgColor: AppStyle.primaryColor,
                      textColor: Colors.white,
                    ),



                  ],
                ),
              );
            },
          ))
    );
  }


}


