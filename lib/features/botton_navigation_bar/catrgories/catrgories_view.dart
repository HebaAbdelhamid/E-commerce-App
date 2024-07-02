import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/custom_category.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_horizontal_category.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'category/category_view.dart';
import 'catrgories_cubit.dart';
import 'catrgories_state.dart';

class CatrgoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CatrgoriesCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHomeHeader(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Categories".tr(),
                  style: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                TextFormField(
                    decoration: InputDecoration(
                  hintText: "Shop By Category".tr(),
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                )),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            MagicRouter.navigateTo(CategoryPage());
                          },
                          child: CustomCategories(
                            image: "assets/images/Frame 1000003077.svg",
                            text1: "Hair Care",
                            text2: "489 Product",
                          ));
                    },
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 2,
                        color: Color(0xffEEEEF0),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
