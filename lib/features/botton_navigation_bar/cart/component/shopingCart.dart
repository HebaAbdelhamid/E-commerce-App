import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_state.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/component/CartItem.dart';

class ShopingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit=BlocProvider.of<CartCubit>(context);
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppStyle.primaryColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            cubit.increament();
                          },
                          child: Text(
                            "+",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                      Text(
                        "${cubit.count}",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            if (cubit.count > 1)
                              cubit.decreament();
                          },
                          child: Text(
                            "-",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                    width: 10
                ),
                CartItem(
                  image: "Rectangle 12349.png",
                  title:
                  '${cubit.getCartResponse!.data!.order!.items![index]
                      .productName}',
                  price:
                  '${cubit.getCartResponse!.data!.order!.items![index].price}',
                  count: cubit.getCartResponse!.data!.order!.items!.length,
                ),
              ],
            );
          },
          itemCount: 2,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 17,
            );
          },
        );
      },
    );
  }

}


