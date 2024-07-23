import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/features/botton_navigation_bar/more/order%20_details/components/productItem.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_orders/return_orders_cubit.dart';
import 'return_order_details_cubit.dart';
import 'return_order_details_state.dart';

class ReturnOrderDetailsPage extends StatelessWidget {
  ReturnOrderDetailsPage({required this.cubit, required this.index,
    required this.itemId
  });
  ReturnOrdersCubit cubit;
  int index;
  var itemId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ReturnOrderDetailsCubit()..getDetailsOrders(itemId??""),
      child:Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ReturnOrderDetailsCubit, ReturnOrderDetailsState>(
            builder: (context, state) {
              var itemId = cubit.returnOrderResponse!.data!.items![index].id;
              final cubit_=BlocProvider.of<ReturnOrderDetailsCubit>(context);
              return state is LoadingSate ||cubit.returnOrderResponse==null? CustomLoading():Padding(
                padding:
                EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    CustomHeader(),
                    SizedBox(
                      height: 10
                    ),
                    Text(
                      "Return Order Details".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Order No. #${cubit.returnOrderResponse!.data!.items![index].id??""}",
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
                                  "Order no. : ",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(.9),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text("${cubit.returnOrderResponse!.data!.items![index].id??""}",
                                    style: TextStyle(
                                        color: AppStyle.blackColor,
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: SizedBox(
                                  ),
                                ),
                                Text("${cubit.returnOrderResponse!.data!.items![index].grandTotal??""} EGP",
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
                                Text(" ${cubit.returnOrderResponse!.data!.items![index].status}".tr(),
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
                              "${cubit.returnOrderResponse!.data!.items![index].returnDate}  ",
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.9),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Return Products".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductItem(
                          image: "Rectangle 12349.png",
                          title: "${cubit_.returnOrderDetailsResponse!.data!.items![index].productName}",
                          price: "${cubit_.returnOrderDetailsResponse!.data!.items![index].price}",
                          count: "${cubit_.returnOrderDetailsResponse!.data!.items![index].quantity}",
                        );
                      },
                      itemCount:cubit_.returnOrderDetailsResponse!.data!.items!.length?? 1,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 17,
                        );
                      },
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.4),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                     Text(
                      "Return Reason".tr(),
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            // color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(8),border: Border.all(color: Colors.grey.withOpacity(.5))),
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child:Text("${cubit_.returnOrderDetailsResponse!.data!.reason} "
                                "النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص ",
                              style: TextStyle(color: Colors.grey),)
                            // Column(
                            //     crossAxisAlignment:
                            //     CrossAxisAlignment.start,
                            //     children: [
                            //       ListTile(
                            //         title: Text(
                            //           "Payemnt Method :",
                            //           style: TextStyle(
                            //               fontSize: 13,
                            //               color: Colors.grey.shade600),
                            //         ),
                            //         subtitle: Text(
                            //           "by credit card",
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               color: AppStyle.blackColor),
                            //         ),
                            //         trailing: Image.asset(
                            //             "assets/images/image 8 (1).png"),
                            //       )
                            //     ])
                        )),
                    SizedBox(
                      height: 13,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(.4),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    //  Text(
                    //   "Attachments".tr(),
                    //   style: TextStyle(
                    //       color: AppStyle.blackColor,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 17),
                    // ),
                    // SizedBox(
                    //   height: 17,
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height*.15,
                    //   child: ListView.separated(
                    //     scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context,index){
                    //   return Container(
                    //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    //     child: Image.asset("assets/images/image11.png",width: MediaQuery.of(context).size.width*.4,fit: BoxFit.cover,),
                    //
                    //   );
                    //   }, separatorBuilder: (context,index){
                    //     return SizedBox(width: 7,);
                    //   }, itemCount: 7),
                    // )

                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.withOpacity(.2),
                    //       borderRadius: BorderRadius.circular(8)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(7),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         ListTile(
                    //           leading: Column(
                    //             children: [
                    //               SvgPicture.asset(
                    //                 "assets/images/Point On Map.svg",
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ],
                    //           ),
                    //           title: Text(
                    //             "Home",
                    //             style: TextStyle(
                    //                 fontSize: 15,
                    //                 color: AppStyle.blackColor),
                    //           ),
                    //           subtitle: Text(
                    //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                    //             style: TextStyle(
                    //                 fontSize: 13,
                    //                 color: Colors.grey.shade600),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ))
    );
  }


}


