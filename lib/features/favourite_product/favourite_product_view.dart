import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/sub_page_header.dart';
import 'package:yiki1/core/styles.dart';

import 'favourite_product_cubit.dart';
import 'favourite_product_state.dart';

class FavouriteProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FavouriteProductCubit()..fetchFavouriteProduct(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {

    return Scaffold(
        body: BlocBuilder<FavouriteProductCubit, FavouriteProductState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<FavouriteProductCubit>(context);
    return SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 17),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SubPageHeader(),
                      SizedBox(height: 7,),
                      Text("Favorite Products".tr(),
                        style: const TextStyle(
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 7,),
                      Text("Favorite Products".tr(),
                        style: const TextStyle(
                            color: Color(0XFFA2A2A3),
                            fontWeight: FontWeight.bold,fontSize: 12),),

                      SizedBox(height: 11,),
                      Divider(color: AppStyle.primaryColor,),
                      SizedBox(height: 11,),
                      state is LoadingState||cubit.getFavouriteResponse==null?CustomLoading():
                      Expanded(
                        child: GridView.builder(

                            scrollDirection: Axis.vertical,
                            itemCount: cubit.getFavouriteResponse!.data!.products!.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1/1.6

                            ), itemBuilder:(context,index)
                        {
                          var id=cubit.getFavouriteResponse!.data!.products![index].id;

                          return Container(
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
                                                child: Text("${cubit.getFavouriteResponse!.data!.products![index].name}",
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
                                                    cubit.fetchFavouriteProduct();
                                                    print(cubit.getFavouriteResponse!.data!.products![0].name);
                                                    // print(cubit.getFavouriteResponse!.data!.products![0].name.toString()??"");
                                                    // cubit.selectedIcon_();
                                                    // print(cubit.count);
                                                  },
                                                  icon: Icon(
                                                     Iconic.heart_solid
                                                        ,
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
                                                    text: "${cubit.getFavouriteResponse!.data!.products![index].price}",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.grey,
                                                        decoration: TextDecoration.lineThrough,
                                                        fontWeight: FontWeight.bold)),
                                                TextSpan(
                                                    text: " ${cubit.getFavouriteResponse!.data!.products![index].priceAfterDiscount}",
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
                                                        if (cubit.getItemCount(int.parse(id.toString()) ) > 1) cubit.decreament(int.parse(id.toString()));
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
                                                    onPressed: (){
                                                      cubit.addToCart(
                                                        id: cubit.getFavouriteResponse!.data!.products![index].id
                                                            .toString(),
                                                        count: "cubit.getItemCount(id).toString()",
                                                      );
                                                      print(id);
                                                    }


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
                          );}),
                      ),


                    ]
                )
            )
        );
  },
));
  }
}


