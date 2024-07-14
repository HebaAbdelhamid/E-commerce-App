import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';
import 'package:yiki1/utils/utils.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    print("===================${cubit.homeResponse!.data!.products!.items![0].price}");
    print("===================${cubit.homeResponse!.data!.products!.items![0].priceAfterDiscount}");
    print("===================${cubit.homeResponse!.data!.products!.items![2].priceAfterDiscount}");
    print("===================${cubit.homeResponse!.data!.products!.items![2].price}");


    return SizedBox(
      height:
      MediaQuery.of(context).size.height *
          0.4,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final id=cubit.homeResponse!.data!.offers!.items![index].id;

          return
            InkWell(
            onTap: () {
              Utils.showBottonSheet(context);
            },
            child:SizedBox(
              width: MediaQuery.of(context).size.width * .47,
              child: Card(
                color: Colors.grey.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/Rectangle 12349.png",
                      width: MediaQuery.of(context).size.width * .47,
                      height: MediaQuery.of(context).size.width * .39,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                          cubit.homeResponse!.data!.offers!.items![index].name.toString(),
                                  style: TextStyle(
                                    color: Color(0xff252525),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit.selectedIcon_();
                                    // print(cubit.count);
                                  },
                                  icon: Icon(
                                    cubit.select
                                        ? Iconic.heart_solid
                                        : Iconic.heart,
                                    color: Colors.red,
                                    size: 17,
                                  ))
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Price:",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff252525),
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:cubit.homeResponse!.data!.offers!.items![index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:cubit.homeResponse!.data!.offers!.items![index].priceAfterDiscount.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppStyle.primaryColor,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white),
                                height: 35,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      child: PriceCount(
                                        title: '-',
                                        color: Colors.white,
                                        width: 29,
                                      ),
                                      onTap: () {
                                        if (cubit.getItemCount(id!) > 1) cubit.decreament(id!);
                                      },
                                    ),
                                    PriceCount(
                                      title: cubit.getItemCount(id!).toString(),
                                      color: Colors.white,
                                      width: 29,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          cubit.increament(id!);
                                        },
                                        child: PriceCount(
                                            title: '+',
                                            color: Colors.white,
                                            width: 29))
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                width: 44,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: AppStyle.primaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: IconButton(
                                  icon: const Icon(
                                    Iconic.shopping_cart_add_solid,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    cubit.addToCart(
                                      id: cubit.homeResponse!.data!.products!.items![0].id
                                          .toString(),
                                    );
                                    // print("==============ttttttt>${cubit.count}");
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
            // Text("tttttttttttttttttttttttttt",style: TextStyle(color: AppStyle.primaryColor),)
            // CustomItemCard(
            //   image:
            //   'assets/images/Rectangle 12349.png',
            //   oldPrice:cubit.homeResponse!.data!.offers!.items![index].price.toString(),
            //   price: cubit.homeResponse!.data!.offers!.items![index].priceAfterDiscount.toString(),
            //   // count: 1,
            //   title: cubit.homeResponse!.data!.offers!.items![index].name.toString(),
            // ),
          );
        },
        // itemBuilderemCount: itemCount,
        itemCount: cubit.homeResponse!.data!.offers!.items!.length,
      ),
    );
  }
}
