import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/category/category_view.dart';

class CustomCategories extends StatelessWidget {
  CustomCategories({
    required this.image,
    required this.text1,
    required this.text2
  });
  String image;
  String text1;
  String text2;
  ///TODO : change to list tile
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppStyle.primaryColor,
            child: SvgPicture.asset(image,width: 48,height: 42,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.0,horizontal: 13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,
                  style: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.bold,fontSize: 17),),
                Text(text2,
                  style: TextStyle(
                      color: Color(0XFFA2A2A3),
                      fontWeight: FontWeight.bold,fontSize: 14),),
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(color:Colors.grey.withOpacity(.1),borderRadius: BorderRadius.circular(45) ),
              child:Center(
                child: IconButton(
                  icon:Icon(Icons.arrow_forward,size: 16,),onPressed: (){
                  MagicRouter.navigateTo(CategoryPage());

                },
                ),
              )
          )


        ],
      ),
    );
  }
}
