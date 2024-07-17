import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomCurrentOrder.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomLastOrder.dart';
import 'my_order_cubit.dart';
import 'my_order_state.dart';

class MyOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => MyOrderCubit()
          ..getCurrentOrders(status: '')
          ..getPastOrders(''),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<MyOrderCubit, MyOrderState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<MyOrderCubit>(context);
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                  child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CustomHeader(),
                        const SizedBox(height: 10),
                        Text(
                          "My Orders".tr(),
                          style: const TextStyle(
                              color: AppStyle.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          " Browse your orders list".tr(),
                          style: const TextStyle(
                              color: Color(0XFFA2A2A3),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const Divider(
                          color: AppStyle.primaryColor,
                          thickness: 2,
                        ),
                        const SizedBox(height: 13),
                        DropdownMenu(
                            onSelected: (value) {
                              print(value);
                              cubit.getCurrentOrders(status: value);
                              cubit.getPastOrders(value);
                            },
                            width: 370,
                            leadingIcon: Icon(Iconic.time_past),
                            label: Text("Filter by order status".tr(),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 13)),
                            dropdownMenuEntries: const [
                              DropdownMenuEntry(
                                leadingIcon: Icon(Iconic.call_history),
                                label: 'Shipping_price_will_be_reviewed',
                                value: "Shipping_price_will_be_reviewed",
                              ),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'Waiting_for_customer_confirmation',
                                  value: "Waiting_for_customer_confirmation"),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'In_the_cart',
                                  value: "In_the_cart"),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'in_review',
                                  value: "in_review"),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'in_progress',
                                  value: "in_progress"),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'in_delivery',
                                  value: "in_delivery"),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'Cancelled',
                                  value: "Cancelled"),
                              DropdownMenuEntry(
                                  leadingIcon: Icon(Iconic.call_history),
                                  label: 'Delivered',
                                  value: "Delivered"),
                            ]),
                        // InkWell(
                        //   onTap: () {
                        //     // cubit.getCountryByName(name: "");
                        //     Utils.showBottonSheetCountries(
                        //       context,
                        //       widget: BlocBuilder(
                        //         bloc: cubit,
                        //         builder: (context, state) {
                        //           if (state is LoadingState) {
                        //             return const CustomLoading();
                        //           } else {
                        //             return SizedBox(
                        //               child: Padding(
                        //                 padding: const EdgeInsets.only(
                        //                     left: 18.0, top: 18, right: 18),
                        //                 child: Column(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   children: [
                        //                     SizedBox(
                        //                       height: MediaQuery.of(context).size.height * .3,
                        //                       child: ListView.separated(
                        //                         itemBuilder:
                        //                             (context, index) {
                        //                           return Column(
                        //                             children: [
                        //                               InkWell(
                        //                                 onTap: () {
                        //                                   // cubit.selectCountry(
                        //                                   //     cubit.countryResponse!.data![index].id);
                        //                                   // country=cubit.countryResponse!.data![index].name!;
                        //                                 },
                        //                                 child: Text("${cubit.orderStatusResponse!.data!.toString()??"jhhhhhhhh"}"
                        //                                 ,
                        //                                   style: const TextStyle(
                        //                                       color: AppStyle
                        //                                           .blackColor,
                        //                                       fontSize: 15),
                        //                                 ),
                        //                               ),
                        //                               const Divider(
                        //                                 color: AppStyle
                        //                                     .greyColor,
                        //                               )
                        //                             ],
                        //                           );
                        //                         },
                        //                         itemCount: 7,
                        //                         separatorBuilder:
                        //                             (context, index) {
                        //                           return const SizedBox(
                        //                               height: 7);
                        //                         },
                        //                       ),
                        //                     ),
                        //                   ],
                        //                 ),
                        //               ),
                        //             );
                        //           }
                        //         },
                        //       ),
                        //     );
                        //   },
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width * .4,
                        //     height: 50,
                        //     decoration: BoxDecoration(
                        //         color: Colors.grey.withOpacity(0.1),
                        //         borderRadius: BorderRadius.circular(7)),
                        //     child: Center(
                        //       child: Text("Filter BY Status ",
                        //         style: TextStyle(color: Colors.grey.shade600),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        const SizedBox(height: 22),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  onTap: () {
                                    cubit.selected_(1);
                                  },
                                  child: CustomCategoryName(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    text: 'Current Orders'.tr(),
                                    color1: cubit.selected == 1
                                        ? AppStyle.primaryColor
                                        : Colors.grey.withOpacity(.2),
                                    color2: cubit.selected == 1
                                        ? Colors.white
                                        : AppStyle.lightBlack,
                                  )),
                              InkWell(
                                  onTap: () {
                                    cubit.selected_(2);
                                    // cubit.getPastOrders("status");
                                  },
                                  child: CustomCategoryName(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    text: 'Past Orders'.tr(),
                                    color1: cubit.selected == 2
                                        ? AppStyle.primaryColor
                                        : Colors.grey.withOpacity(.2),
                                    color2: cubit.selected == 2
                                        ? Colors.white
                                        : AppStyle.lightBlack,
                                  )),
                            ]),
                        cubit.selected == 1
                            ? state is LoadingState ||
                                    cubit.orderResponse == null
                                ? Center(child: CustomLoading())
                                : CustomCurrentOrder(cubit)
                            : CustomLastOrder()
                      ]),
                );
              },
            )));
  }
}
