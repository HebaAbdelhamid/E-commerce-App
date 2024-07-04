import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';
import 'package:yiki1/utils/utils.dart';

class Products extends StatelessWidget {
  const Products({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    print("===================${cubit.homeResponse!.data!.products!.items![0].price}");
    print("===================${cubit.homeResponse!.data!.products!.items![0].priceAfterDiscount}");
    print("===================${cubit.homeResponse!.data!.products!.items![2].priceAfterDiscount}");
    print("===================${cubit.homeResponse!.data!.products!.items![2].price}");


    return SizedBox(
      height:
      MediaQuery.of(context).size.height *
          0.4,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Utils.showBottonSheet(context);
            },
            child:
            // Text("tttttttttttttttttttttttttt",style: TextStyle(color: AppStyle.primaryColor),)
            CustomItemCard(
              image:
              'assets/images/Rectangle 12349.png',
              oldPrice:cubit.homeResponse!.data!.offers!.items![index].price.toString(),
              price: cubit.homeResponse!.data!.offers!.items![index].priceAfterDiscount.toString(),
              // count: 1,
              title: cubit.homeResponse!.data!.offers!.items![index].name.toString(),
            ),
          );
        },
        // itemBuilderemCount: itemCount,
        itemCount: cubit.homeResponse!.data!.offers!.items!.length,
      ),
    );
  }
}
