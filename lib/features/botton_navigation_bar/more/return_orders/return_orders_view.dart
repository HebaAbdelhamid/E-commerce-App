import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_order_details/return_order_details_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_orders/components/CustomOrderItem.dart';

import 'return_orders_cubit.dart';
import 'return_orders_state.dart';

class ReturnOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ReturnOrdersCubit()..getReturnOrders(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ReturnOrdersCubit,ReturnOrdersState>(
            builder: (context, state) {
              final cubit=BlocProvider.of<ReturnOrdersCubit>(context);
              return  state is LoadingState?CustomLoading(): Padding(
                padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                child: ListView(
                    children:  [
                      CustomHeader(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Return Orders".tr(),
                        style: const TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 13
                      ),
                      Text(
                        " Browse your return orders list".tr(),
                        style: const TextStyle(
                            color: Color(0XFFA2A2A3),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const Divider(
                        color: AppStyle.primaryColor,
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 13
                      ),
                      DropdownMenu(onSelected: (value){
                        print(value);
                        cubit.getReturnOrders();
                      },
                          width: 370,
                          leadingIcon: Icon(Iconic.time_past),
                          label: Text("Filter by order status".tr(),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 13)),
                          dropdownMenuEntries:
                          const [
                            DropdownMenuEntry(
                              leadingIcon: Icon(Iconic.call_history),
                              label: 'Accepted_and_being_received',
                              value: "Accepted_and_being_received",),
                            DropdownMenuEntry(
                                leadingIcon: Icon(Iconic.call_history),
                                label: 'Cancelled',
                                value: "Cancelled"),

                          ]
                      ),
                      SizedBox(height: 22,),
                      CustomOrderItem(cubit)





                    ]),
              );
            },
          ))
    );
  }


}


