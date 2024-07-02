import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/sub_page_header.dart';
import 'package:yiki1/core/styles.dart';

import 'favourite_product_cubit.dart';
import 'favourite_product_state.dart';

class FavouriteProductPage extends StatelessWidget {
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
                            child: CustomItemCard(image: 'assets/images/Rectangle 12349.png',
                              oldPrice: '180.00',
                              price: '150.00',
                              // count: 1,
                              title: "keratin Serum",
                            ),
                          );}),
                      ),


                    ]
                )
            )
        ));
  }
}


