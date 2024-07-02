import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInInDelivered.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInPRgress.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInReview.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomCurrentOrder.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomLastOrder.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomOrderICanceled.dart';

import 'my_order_cubit.dart';
import 'my_order_state.dart';

class MyOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MyOrderCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<MyOrderCubit, MyOrderState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<MyOrderCubit>(context);
    return Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
            child: ListView(
                children:  [
                  CustomHeader(),
              SizedBox(
                height: 10,
              ),
              Text(
                "My Orders".tr(),
                style: TextStyle(
                    color: AppStyle.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                " Browse your orders list".tr(),
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
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(onTap: (){
                    cubit.selected_(1);
                    print("======${cubit.selected}");
                  },
                      child: CustomCategoryName(width: MediaQuery.of(context).size.width*.4, text: 'Current Orders'.tr(), color1:cubit.selected==1? AppStyle.primaryColor:Colors.grey.withOpacity(.2),color2:cubit.selected==1?Colors.white: AppStyle.lightBlack,)),
                  InkWell(onTap: (){
                    cubit.selected_(2);
                    print("===============${cubit.selected}");


                  },
                      child: CustomCategoryName(width: MediaQuery.of(context).size.width*.4, text: 'Past Orders'.tr(), color1:cubit.selected==2? AppStyle.primaryColor:Colors.grey.withOpacity(.2),color2:cubit.selected==2?Colors.white: AppStyle.lightBlack,)),

                ]),
                  cubit.selected==1?CustomCurrentOrder():CustomLastOrder()





            ]),
          );
  },
))
    );
  }


}




