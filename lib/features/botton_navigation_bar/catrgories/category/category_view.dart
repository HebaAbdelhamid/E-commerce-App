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
import 'package:yiki1/common_component/custom_new_arrival.dart';
import 'package:yiki1/common_component/sub_page_header.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_view.dart';

import 'category_cubit.dart';
import 'category_state.dart';

class CategoryPage extends StatelessWidget {
  List categoryName = ["All", "Hair Care", "Body Care"];
  List<Color> color = [
    AppStyle.primaryColor,
    Colors.grey.withOpacity(.1),
    Colors.grey.withOpacity(.1)
  ];
  List<Color> textColor = [
    Colors.white,
    AppStyle.lightBlackColor,
    AppStyle.lightBlackColor,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CategoryCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<CategoryCubit>(context);

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        final controller = BlocProvider.of<CategoryCubit>(context);

        ///TODO : change this
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
                    child: ListView.builder(
                      itemCount: categoryName.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomCategoryName(
                                  color1: color[index],
                                  color2: textColor[index],
                                  text: categoryName[index],
                                  width: MediaQuery.of(context).size.width * .3,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                              ]),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 9,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1 / 1.6),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return const ProductDetailsBottonSheet();
                                  });
                            },
                            child: CustomItemCard(
                              image: 'assets/images/Rectangle 12349.png',
                              oldPrice: '180.00',
                              price: '150.00',
                              // count: 1,
                              title: "keratin Serum",
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
    );
  }
}
