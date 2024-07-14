import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/sub_page_header.dart';
import 'package:yiki1/core/styles.dart';

import 'favourite_product_cubit.dart';
import 'favourite_product_state.dart';

class FlashSalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavouriteProductCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<FavouriteProductCubit>(context);

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 17),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubPageHeader(),
                      SizedBox(height: 7,),
                      Text("Favorite Products".tr(),
                        style: TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 7,),
                      Text("Favorite Products".tr(),
                        style: TextStyle(
                            color: Color(0XFFA2A2A3),
                            fontWeight: FontWeight.bold,fontSize: 12),),

                      SizedBox(height: 11,),
                      Divider(color: AppStyle.primaryColor,),
                      SizedBox(height: 11,),
                      Expanded(
                        child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: 9,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1/1.6

                            ), itemBuilder:(context,index)
                        {
                          return Container(
                            child: SizedBox(
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
                                                  "title",
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
                                                    // cubit.selectedIcon_();
                                                    // print(cubit.count);
                                                  },
                                                  icon: Icon(
                                                    Iconic.heart_solid,
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
                                                    text: "oldPrice",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.lineThrough,
                                                        fontWeight: FontWeight.bold)),
                                                TextSpan(
                                                    text: "price",
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
                                                        // if (cubit.getItemCount(int.parse(id) ) > 1) cubit.decreament(int.parse(id));
                                                      },
                                                    ),
                                                    PriceCount(
                                                      title: "cubit.getItemCount(int.parse(id)).toString()",
                                                      color: Colors.white,
                                                      width: 29,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          // cubit.increament(int.parse(id));
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
                                                    onPressed: (){}
                                                  //   () {
                                                  // cubit.addToCart(
                                                  //   id: cubit.homeResponse!.data!.products!.items![0].id
                                                  //       .toString(),
                                                  // );
                                                  // print("==============ttttttt>${cubit.count}");
                                                  // },
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
                            // CustomItemCard(image: 'assets/images/Rectangle 12349.png',
                            //   oldPrice: '180.00',
                            //   price: '150.00',
                            //   // count: 1,
                            //   title: "keratin Serum",
                            //   id:"id"
                            // ),
                          );}),
                      ),


                    ]
                )
            )
        ));
  }
}


