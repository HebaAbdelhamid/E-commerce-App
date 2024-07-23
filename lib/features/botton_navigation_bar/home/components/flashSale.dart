import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/BottonSheet/botton_sheet_productDetails.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_state.dart';
import 'package:yiki1/utils/utils.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<HomeCubit>(context);
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final id=cubit.homeResponse!.data!.products!.items![index].id;
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return ProductDetailsBottonSheet(id_: id,);
                      });
                  // Utils.showBottonSheet(context);
                  print( cubit.homeResponse!.data!.products!.items!.length);

                },
                child:
                SizedBox(
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
                          fit: BoxFit.cover,
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
                                  Text(cubit.homeResponse!.data!.products!.items![index].name.toString(),
                                    style: const TextStyle(
                                      color: Color(0xff252525),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        // cubit.selectedIcon_();
                                        cubit.selectedIndex_(index);
                                         var itemId=cubit.homeResponse!.data!.products!.items![index].id.toString();
                                       cubit.addToFavourite(product_id: itemId);
                                        // print(cubit.count);
                                      },
                                      icon: Icon(
                                        cubit.selectedIndex==index
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
                                    const TextSpan(
                                        text: "Price:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff252525),
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: cubit.homeResponse!.data!.products!.items![index].price.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            decoration: TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: cubit.homeResponse!.data!.products!.items![index].price.toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: AppStyle.primaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 9
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
                                            if (cubit.getItemCount(id!) > 1) cubit.decreament(id);
                                          },
                                        ),
                                        PriceCount(
                                          title: cubit.getItemCount(id!).toString(),
                                          color: Colors.white,
                                          width: 29,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              cubit.increament(id);
                                              print(cubit.getItemCount(id).toString());
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
                                    width: MediaQuery.of(context).size.width*.12,
                                    height: MediaQuery.of(context).size.height*.05,
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
                                          id: cubit.homeResponse!.data!.products!.items![index].id
                                              .toString(),
                                          count: cubit.getItemCount(id).toString(),
                                        );print("==============ttttttt>${cubit.getItemCount(id).toString()}");


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
                  ).animate()  .move(duration: 800.ms) // runs after the above w/new duration
                  ,
                )

              );
            },
            itemCount: cubit.homeResponse!.data!.products!.items!.length,
            // itemCount: 1,
          ),
        );
      },
    );
  }
}
