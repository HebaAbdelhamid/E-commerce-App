import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_horizontal_category.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/category/category_view.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/catrgories_cubit.dart';

class Categories extends StatelessWidget {
   Categories({
    super.key,
  });
var startAnimation;
  @override
  Widget build(BuildContext context) {
    final cubit =BlocProvider.of<CatrgoriesCubit>(context);

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
cubit.animation();

      });

    print(cubit.categoryResponse!.data!.items![0].subCategories![0].name);
print(  "${ cubit.categoryResponse!.data!.items![0].subCategories![0].description} ===========",);
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        var time=500*1.7*index;
        return InkWell(
            onTap: () {
              var id=cubit.categoryResponse!.data!.items![index].id;
              print("ttttttttttttttt${cubit.categoryResponse!.data!.items![index].id}");
              MagicRouter.navigateTo(CategoryPage(id:id!));
            },
            child: CustomCategories(
              image: "assets/images/Frame 1000003077.svg",
              text1: cubit.categoryResponse!.data!.items![index].name.toString(),
              text2: "${ cubit.categoryResponse!.data!.items![index].products.toString()} Product",
            )).animate().fadeIn( duration:time.ms);
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
