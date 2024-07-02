import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/BottonSheet/FilterBottonSheet.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/customCarouselSlider.dart';
import 'package:yiki1/common_component/custom_category.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/custom_new_arrival.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_state.dart';
import 'package:yiki1/features/new_offer/new_offer_view.dart';
import 'package:yiki1/utils/utils.dart';
import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
              child: ListView(shrinkWrap: true, children: [
                BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomHomeHeader(),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomSubHeaderHome(
                      function: () {
                        showModalBottomSheet(
                            context: context, builder: (context){
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).viewInsets.bottom),
                            child: const FilterBottonSheet(),
                          );
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCarouselSlider(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Flash Sale".tr(),
                              style: TextStyle(
                                  color: AppStyle.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              "Discover Our Flash Sale".tr(),
                              style: TextStyle(
                                  color: Color(0XFFA2A2A3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.1),
                                borderRadius: BorderRadius.circular(45)),
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                                onPressed: () {
                                  MagicRouter.navigateTo(NewOfferPage());
                                },
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Utils.showBottonSheet(context);
                            },
                            child: CustomItemCard(
                              image: 'assets/images/Rectangle 12349.png',
                              oldPrice: '180.00',
                              price: '150.00',
                              // count: 1,
                              title: "keratin Serum",
                            ),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categories".tr(),
                              style: TextStyle(
                                  color: AppStyle.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              "Shop By Category".tr(),
                              style: TextStyle(
                                  color: Color(0XFFA2A2A3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.1),
                                borderRadius: BorderRadius.circular(45)),
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                                onPressed: () {
                                  MagicRouter.navigateTo(CatrgoriesPage());
                                },
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 165,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategory(
                            image: "assets/images/Frame 1000003077.svg",
                            text1: "Hair Care",
                            text2: "489 Product",
                          );
                        },
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 5);
                        },
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xffEEEEF0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            cubit.selectedIcon();
                          },
                          child:cubit.selected? CustomNewArrival(
                            color1: AppStyle.primaryColor,
                            color2: Colors.white,
                            image: "assets/images/Vector (Stroke).svg",
                            text: "New Arrivals",
                            width: MediaQuery.of(context).size.width * .4,
                          ):CustomNewArrival(
                            color1:Colors.grey.withOpacity(.1),
                            color2: AppStyle.lightBlackColor,
                            image: "assets/images/Vector (Stroke).svg",
                            text: "New Arrivals",
                            width: MediaQuery.of(context).size.width * .4,
                          ),),
                        InkWell(
                            onTap: (){
                              cubit.selectedIcon();
                            },
                            child:cubit.selected?
                            CustomNewArrival(
                              color1: Colors.grey.withOpacity(.1),
                              color2: AppStyle.lightBlackColor,
                              image: "assets/images/Star Shine.svg",
                              text: "Featured",
                              width: MediaQuery.of(context).size.width * .4,
                            ):CustomNewArrival(
                              color1: AppStyle.primaryColor,
                              color2: Colors.white,
                              image: "assets/images/Star Shine.svg",
                              text: "Featured",
                              width: MediaQuery.of(context).size.width * .4,
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomItemCard(
                            image: 'assets/images/Rectangle 12349.png',
                            oldPrice: '180.00',
                            price: '150.00',
                            // count: 1,
                            title: "keratin Serum",
                          );
                        },
                        itemCount: 10,
                      ),
                    ),
                  ],
                );
  },
),
              ]),
            ), //Rectangle 1885.png
          ))
    );
  }

}
