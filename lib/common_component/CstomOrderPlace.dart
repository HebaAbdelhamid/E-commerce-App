import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/styles.dart';

import '../features/botton_navigation_bar/cart/complete_order/complete_order_cubit.dart';
import '../features/botton_navigation_bar/cart/complete_order/complete_order_state.dart';

class CustomeOrderPlace extends StatelessWidget {
  CustomeOrderPlace({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.color
  });

  String text1;
  String text2;
  String text3;
  String text4;
  Color color;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteOrderCubit, CompleteOrderState>(
  builder: (context, state) {
    final cubit = BlocProvider.of<CompleteOrderCubit>(context);

    return Container(
      decoration: BoxDecoration(
        // boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.2),offset: Offset(4, 8),blurRadius: 4,spreadRadius: 0)],
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/images/Point On Map.svg",
                  fit: BoxFit.cover,
                ),
                Text(
                  text1,
                  style: TextStyle(color: AppStyle.lightBlack, fontSize: 15),
                ),
                SizedBox(
                  width: 100,
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                text2,
                style: TextStyle(
                    color: AppStyle.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Text(
                text3,
                style: TextStyle(
                    color: Color(0XFFA2A2A3),
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(.3),
            ),
            Row(
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    "assets/images/Trash Bin Trash.svg",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  width: 7,
                ),
                InkWell(
                  child: SvgPicture.asset(
                    "assets/images/Vectorr5.svg",
                    fit: BoxFit.cover,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  width: 130,
                ),

              ],
            )
          ],
        ),
      ),
    );
  },
);
  }
}
