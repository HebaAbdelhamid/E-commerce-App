import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
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
      create: (BuildContext context) => ReturnOrdersCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ReturnOrdersCubit,ReturnOrdersState>(
            builder: (context, state) {
              final cubit=BlocProvider.of<ReturnOrdersCubit>(context);
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                child: ListView(
                    children:  [
                      CustomHeader(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Return Orders".tr(),
                        style: TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        " Browse your return orders list".tr(),
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
                      DropdownMenu(
                          width: 370,
                          leadingIcon: Icon(Iconic.time_past),
                          label: Text("Filter by order status".tr(),style:TextStyle(color: Colors.grey,fontSize: 13)),
                          dropdownMenuEntries:[
                            DropdownMenuEntry(
                                leadingIcon: Icon(Iconic.call_history), label: 'Filter by order status',
                                value: "ttttttttttt"

                            ),
                            DropdownMenuEntry(
                                leadingIcon: Icon(Iconic.call_history), label: 'Filter by order status',
                                value: "ttttttttttt"

                            ),
                            DropdownMenuEntry(
                                leadingIcon: Icon(Iconic.call_history), label: 'Filter by order status',
                                value: "ttttttttttt"

                            ),
                            DropdownMenuEntry(
                                leadingIcon: Icon(Iconic.call_history), label: 'Filter by order status',
                                value: "ttttttttttt"

                            ),
                          ]
                      ),
                      SizedBox(height: 22,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*.8,
                        child: ListView.separated(itemBuilder: (context,index){
                          return InkWell(onTap: (){
                            MagicRouter.navigateTo(ReturnOrderDetailsPage());
                          },
                              child: CustomOrderItem());
                        }, separatorBuilder: (context,index){return SizedBox(height: 7,);}, itemCount: 7),
                      )





                    ]),
              );
            },
          ))
    );
  }


}


