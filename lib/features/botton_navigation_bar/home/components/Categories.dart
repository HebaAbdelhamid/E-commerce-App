import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_category.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';

class Categories extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    print(cubit.homeResponse!.data!.products);

    return SizedBox(
      height: 165,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomCategory(
            image: "assets/images/Frame 1000003077.svg",
            text1: cubit.homeResponse!.data!.categories![index].name.toString(),
            text2: "${cubit.homeResponse!.data!.categories![index].products.toString()} Product",
          );


        },
        itemCount: cubit.homeResponse!.data!.categories!.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 5);
        },
      ),
    );
  }
}
