import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_view.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 60,
          height: 35,
          decoration: BoxDecoration(
            color: AppStyle.lightGrayColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppStyle.blackColor,
            ),
            onPressed: () {
              MagicRouter.pop();
            },
          ),
        ),
        Container(
            width: 44,
            height: 45,
            decoration: BoxDecoration(
                color: AppStyle.lightGrayColor,
                borderRadius: BorderRadius.circular(45)),
            child: IconButton(
              icon: Icon(Iconic.shopping_cart),
              onPressed: () {
                MagicRouter.navigateTo(BottonNavigationBarPage(currentIndex: 2,));

                // MagicRouter.navigateTo(CartPage());
              },
            )),
      ],
    );
  }
}