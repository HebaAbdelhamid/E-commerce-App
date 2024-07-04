import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_horizontal_category.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_state.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/components/categories.dart';
import 'category/category_view.dart';
import 'catrgories_cubit.dart';

class CatrgoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      CatrgoriesCubit()
        ..fetchCategory(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: BlocBuilder<CatrgoriesCubit, CatrgoriesState>(
            builder: (context, state) {
              return state is LoadingCatrgoriesState ? CustomLoading() :
               Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 28.0, horizontal: 20),
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
                      child: Categories(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

