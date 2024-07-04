import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/BottonSheet/FilterBottonSheet.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_new_arrival.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/components/Categories.dart';
import 'package:yiki1/features/botton_navigation_bar/home/components/customCarouselSlider.dart';
import 'package:yiki1/features/botton_navigation_bar/home/components/flashSale.dart';
import 'package:yiki1/features/botton_navigation_bar/home/components/products.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_state.dart';
import 'package:yiki1/features/new_offer/new_offer_view.dart';
import 'home_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeCubit()..fetchHome(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<HomeCubit>(context);
                  return state is LoadingState
                      ? CustomLoading()
                      : ListView(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomHomeHeader(),
                                    const SizedBox(height: 10),
                                    CustomSubHeaderHome(
                                      function: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child:
                                                    const FilterBottonSheet(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                color:
                                                    Colors.grey.withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(45)),
                                            child: Center(
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  size: 16,
                                                ),
                                                onPressed: () {
                                                  MagicRouter.navigateTo(
                                                      NewOfferPage());
                                                },
                                              ),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    FlashSale(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Categories".tr(),
                                              style: const TextStyle(
                                                  color: AppStyle.blackColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            Text(
                                              "Shop By Category".tr(),
                                              style: const TextStyle(
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
                                                color:
                                                    Colors.grey.withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(45)),
                                            child: Center(
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  size: 16,
                                                ),
                                                onPressed: () {
                                                  MagicRouter.navigateTo(
                                                      CatrgoriesPage());
                                                },
                                              ),
                                            ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Categories(),
                                    const Divider(
                                      thickness: 2,
                                      color: Color(0xffEEEEF0),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            cubit.selectedIcon();
                                          },
                                          child: cubit.selected
                                              ? CustomNewArrival(
                                                  color1: AppStyle.primaryColor,
                                                  color2: Colors.white,
                                                  image:
                                                      "assets/images/Vector (Stroke).svg",
                                                  text: "New Arrivals",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .4,
                                                )
                                              : CustomNewArrival(
                                                  color1: Colors.grey
                                                      .withOpacity(.1),
                                                  color2:
                                                      AppStyle.lightBlackColor,
                                                  image:
                                                      "assets/images/Vector (Stroke).svg",
                                                  text: "New Arrivals",
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .4,
                                                ),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              cubit.selectedIcon();
                                            },
                                            child: cubit.selected
                                                ? CustomNewArrival(
                                                    color1: Colors.grey
                                                        .withOpacity(.1),
                                                    color2: AppStyle
                                                        .lightBlackColor,
                                                    image:
                                                        "assets/images/Star Shine.svg",
                                                    text: "Featured",
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .4,
                                                  )
                                                : CustomNewArrival(
                                                    color1:
                                                        AppStyle.primaryColor,
                                                    color2: Colors.white,
                                                    image:
                                                        "assets/images/Star Shine.svg",
                                                    text: "Featured",
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .4,
                                                  ))
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                     Products(),
                                  ]),
                            ]);
                },
              ), //Rectangle 1885.png
            )));
  }
}
