import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/common_component/BottonSheet/RatingPage.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_order_details/return_order_details_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_order_reason/return_order_reason_view.dart';

class CustomOrderInDelivered extends StatelessWidget {
  const CustomOrderInDelivered({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration:BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(5)) ,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Order no. : ".tr(),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text("#46679797",
                      style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                  SizedBox(width: MediaQuery.of(context).size.width*.27,),
                  Text("2500 EGP",
                      style: TextStyle(color: AppStyle.primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Order Status :  ".tr(),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text("Delivered".tr(),
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  SizedBox(width: MediaQuery.of(context).size.width*.27,),
                ],
              ),
              Text(
                "Sunday , 12 Nov 2023  ",
                style: TextStyle(
                    color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 23,),
              InkWell(
                onTap:(){
                  showModalBottomSheet(
                      isScrollControlled: true,

                      context: context, builder: (context){

                    return Padding(
                      padding: MediaQuery.of(context).viewInsets,

                      child: RatingPage(),
                    );
                  }
                  );
                } ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(

                      width: MediaQuery.of(context).size.width*.37,
                      height: 40,
                      decoration: BoxDecoration(color: AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Rate Order".tr(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,fontSize: 15),),

                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        MagicRouter.navigateTo(ReturnOrderReasonPage());
                      },
                      child: Container(

                        width: MediaQuery.of(context).size.width*.37,
                        height: 40,
                        decoration: BoxDecoration(color:  Colors.white,borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Return order".tr(),
                              style: TextStyle(
                                  color: AppStyle.redColor,
                                  fontWeight: FontWeight.bold,fontSize: 15),),

                          ],
                        ),
                      ),
                    )
                    // CustomButton(title: "Track", function: (){}, bgColor:AppStyle.primaryColor , textColor: Colors.white),


                    // InkWell(
                    //   onTap: (){
                    //     MagicRouter.pop();
                    //   },
                    //   child:
                    //   CustomCategoryName(width: MediaQuery.of(context).size.width*.4, text: 'Past Orders', color1:Colors.white ,color2:AppStyle.redColor ,),
                    //   ),


                  ],
                ),
              )


            ],
          ),
        ),
      );
  }
}
