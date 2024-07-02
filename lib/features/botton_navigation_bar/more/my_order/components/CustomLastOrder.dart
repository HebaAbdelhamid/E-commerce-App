import 'package:flutter/material.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInInDelivered.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustomOrderICanceled.dart';

class CustomLastOrder extends StatelessWidget {
  const CustomLastOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 22,),
      CustomOrderInDelivered(),
      SizedBox(height: 13,),
      SizedBox(
        height: 900,
        child: ListView.separated(itemBuilder: (context,index){
          return  CustomOrderCanceled();
        }, separatorBuilder: (context,index){
          return                   SizedBox(height: 13,);

        }, itemCount: 7),
      )
    ],);
  }
}
