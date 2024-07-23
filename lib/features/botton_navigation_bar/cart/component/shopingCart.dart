import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_state.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/component/CartItem.dart';

class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<CartCubit>(context);
        return  ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                print(cubit.getCartResponse!.data!.order!.items!.length);
                final item =
                    cubit.getCartResponse!.data!.order!.items![index];
                final itemId = item.id;
                cubit.getCartResponse!.data!.order!.items![index]
                        .productQuantity ??
                    1;
                var id = cubit.getItemCount(itemId!).toString();
                int? quantity = cubit.getCartResponse!.data!.order!
                        .items![index].productQuantity ??
                    1;

                return Row(
                  children: [
                    Container(
                      width: 60,
                      height: MediaQuery.of(context).size.height * .2,
                      decoration: BoxDecoration(
                          color: AppStyle.primaryColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
cubit.increamentCount(index);
                              },
                              child: const Text(
                                "+",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                          Text(
                            cubit.getCount(index).toString(),
                            maxLines: 2, overflow: TextOverflow.ellipsis,
                            // cubit.getItemCount(itemId! ).toString(),
                            style: TextStyle(
                                fontSize: 22, color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
cubit.decrementCount(index)  ;
print(cubit.getCartResponse!.data!.order!
                                    .items!.length);
                              },
                              child: const Text(
                                "-",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    CartItem(
                      bloc: cubit,
                      image: "Rectangle 12349.png",
                      title:
                          '${cubit.getCartResponse!.data!.order!.items![index].productName}',
                      price:
                          '${cubit.getCartResponse!.data!.order!.items![index].price}',
                      count:
                          cubit.getCartResponse!.data!.order!.items!.length,
                      id: int.parse(id),
                      function: () {
                        cubit.deleteCartItems(int.parse(itemId.toString()));
                        cubit.fetchCartItems();
                      },
                    ),
                  ],
                );
              },
              itemCount:
                  cubit.getCartResponse!.data!.order!.items!.length ?? 1,
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
