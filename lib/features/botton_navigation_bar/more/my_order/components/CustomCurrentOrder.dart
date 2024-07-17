import 'package:flutter/material.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInPRgress.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_cubit.dart';

class CustomCurrentOrder extends StatelessWidget {
   CustomCurrentOrder(this. cubit, {
    super.key,
  });
  MyOrderCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 22,),
        SizedBox(
          height: 700,
          child: ListView.separated(itemBuilder: (context,index){
            return

              Column(
                children: [
                  CustmorderInPRogress(cubit),
                ],
              );
          }, separatorBuilder: (context,index){
            return                   SizedBox(height: 13,);

          }, itemCount: cubit.orderResponse!.data!.items!.length),
        )
      ],
    );
  }
}
