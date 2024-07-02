import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/new_offer/new_offer_view.dart';

class FilterBottonSheet extends StatelessWidget {
  const FilterBottonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              color: Colors.grey.withOpacity(.2)),
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Filter".tr(),
                  style: TextStyle(
                      color: AppStyle.blackColor,
                      fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(height: 5,),
                Text("Filter & Sort Products".tr(),
                  style: TextStyle(
                      color: Color(0XFFA2A2A3),
                      fontWeight: FontWeight.bold,fontSize: 13),),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,

          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Show Products".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 5,),
                  CustomItemWithRadio(title: "All Products".tr(),group: "1",),
                  CustomItemWithRadio(title: "Offers Only".tr(),group: "1",),
                  Divider(thickness: 1,
                      color: Colors.grey
                  ),
                  SizedBox(height: 7,),
                  Text("Filter By Price".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,fontSize: 15),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Min Price".tr(),
                            style: TextStyle(
                              color: AppStyle.lightBlack,),),
                          Container(width: 157,height: 50,color:Colors.grey.withOpacity(.2),child: TextFormField(),),
                        ],
                      ),
                      SizedBox(width: 6,),
                      Column(
                        children: [
                          Text("Max Price".tr(),
                            style: TextStyle(
                              color: AppStyle.lightBlack,),),
                          Container(width: 157,height: 50,color:Colors.grey.withOpacity(.2),child: TextFormField(),),
                        ],
                      )

                    ],
                  ),

                  Divider(thickness: 1,
                      color: Colors.grey
                  ),
                  Text("Sort By".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,fontSize: 15),),

                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: CustomItemWithRadio(title: "Price (Low to High)".tr(),group: "2",),
                  ),
                  CustomItemWithRadio(title: "Price (High to low)".tr(),group: "2"),
                  CustomItemWithRadio(title: "Alphabetically ( From A to Z )".tr(),group: "2"),
                  CustomItemWithRadio(title: "Alphabetically ( From Z to A )".tr(),group: "2"),
                  CustomItemWithRadio(title: "Newest to oldest".tr(),group: "2"),
                  CustomItemWithRadio(title: "Oldest to newest".tr(),group: "2"),
                  SizedBox(height: 7,),
                  CustomButton(title: 'Apply'.tr(), function: (){
                    MagicRouter.pop();
                  },bgColor: AppStyle.primaryColor,textColor: Colors.white),
                  SizedBox(height: 7,),









                ],
              ),
            ),
          ],
        )



      ],
    );
  }
}
