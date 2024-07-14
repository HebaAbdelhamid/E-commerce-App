import 'dart:core';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/BottonSheet/botton_sheet_productDetails.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_new_arrival.dart';
import 'package:yiki1/common_component/sub_page_header.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';

import 'category_cubit.dart';
import 'category_state.dart';

class CategoryPage extends StatelessWidget {
  List categoryName = ["All", "Hair Care", "Body Care"];
  List<Color> color = [
    AppStyle.primaryColor,
    Colors.grey.withOpacity(.1),
    Colors.grey.withOpacity(.1),
  ];
  List<Color> textColor = [
    Colors.white,
    AppStyle.lightBlackColor,
    AppStyle.lightBlackColor,
  ];

  CategoryPage({required this. id,super.key});
  int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoryCubit()..fetchCategory()..fetchCategoryProduct(category_id: "1"),
      child:  BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<CategoryCubit>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 28.0, horizontal: 17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubPageHeader(),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Yuki Store",
                      style: TextStyle(
                          color: AppStyle.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "Discover Our Flash Sale",
                      style: TextStyle(
                          color: Color(0XFFA2A2A3),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    // IconButton(icon:Icon(Icons.add),onPressed: (){
                    //   cubit.addToCart();
                    //
                    // },),
                    SizedBox(
                      height: 17,
                    ),
                    CustomSubHeaderHome(
                      function: () {},
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Divider(
                      color: AppStyle.primaryColor,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child:state is LoadingCategoryNameState ||cubit.categoryResponse==null?Center(child: Text("Loading......",style: TextStyle(fontWeight: FontWeight.bold),)):
                      ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: CustomCategoryName(
                                    color1: cubit.selectedIndex==index?AppStyle.primaryColor:Colors.white,
                                    color2: cubit.selectedIndex==index?Colors.white:AppStyle.primaryColor,
                                    text: cubit.categoryResponse!.data!.items![index].name.toString(),
                                    width: MediaQuery.of(context).size.width * .4,
                                  ),
                                  onTap: (){
                                    cubit.changeSelectedIndex(index);
                                    cubit.fetchCategoryProduct(category_id: cubit.categoryResponse!.data!.items![index].id);
                                    // print(cubit.categoryResponse!.data!.items!.length);
                                    // //4
                                    // print(cubit.categoryResponse!.data!.items![3].name);

                                  },
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                              ]);
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    state is LoadingCategoryState ||cubit.categoryProductResponse==null?CustomLoading():
                    Expanded(
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          // itemCount: 1,
                          itemCount: cubit.categoryProductResponse!.data!.items!.length??1,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1 / 1.6),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // showModalBottomSheet(
                                //     context: context,
                                //     builder: (context) {
                                //       return  ProductDetailsBottonSheet(cubit as HomeCubit);
                                //     });
                              },
                              child: CustomItemCard(
                                id:cubit.categoryProductResponse!.data!.items![index].id.toString(),
                                image: 'assets/images/Rectangle 12349.png',
                                oldPrice: cubit.categoryProductResponse!.data!.items![index].price.toString(),
                                price: cubit.categoryProductResponse!.data!.items![index].priceAfterDiscount.toString(),
                                // count: 1,
                                title: cubit.categoryProductResponse!.data!.items![index].name.toString(),
                                function:() {
                                  cubit.addToCart(
                                    id: cubit.categoryProductResponse!.data!.items![0].id
                                        .toString(),
                                    count: cubit.getItemCount(id).toString(),
                                  );
                                }
                                // cubit.addToCart(),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }



}
