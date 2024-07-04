import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_horizontal_category.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/category/category_view.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit =BlocProvider.of<CatrgoriesCubit>(context);
    print(cubit.categoryResponse!.data!.items![0].subCategories![0].name);
print(  "${ cubit.categoryResponse!.data!.items![0].subCategories![0].description} ===========",);
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              print("ttttttttttttttt${cubit.categoryResponse!.data!.items![index].id}");
              MagicRouter.navigateTo(CategoryPage());
            },
            child: CustomCategories(
              image: "assets/images/Frame 1000003077.svg",
              text1: cubit.categoryResponse!.data!.items![index].name.toString(),
              text2: "${ cubit.categoryResponse!.data!.items![index].products.toString()} Product",
            ));
      },
      itemCount: cubit.categoryResponse!.data!.items!.length,


      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
          color: Color(0xffEEEEF0),
        );
      },
    );
  }
}
