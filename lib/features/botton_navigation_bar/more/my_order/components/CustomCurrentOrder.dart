import 'package:flutter/material.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInPRgress.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInReview.dart';

class CustomCurrentOrder extends StatelessWidget {
  const CustomCurrentOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 22,),
        CustmOrderInReview(),
        SizedBox(height: 13,),
        SizedBox(
          height: 900,
          child: ListView.separated(itemBuilder: (context,index){
            return  CustmorderInPRogress();
          }, separatorBuilder: (context,index){
            return                   SizedBox(height: 13,);

          }, itemCount: 7),
        )
      ],
    );
  }
}
