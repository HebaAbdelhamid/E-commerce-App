import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/common_component/BottonSheet/RatingPage.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_order_reason/return_order_reason_view.dart';

class CustomOrderCanceled extends StatelessWidget {
   CustomOrderCanceled( {
    required this. cubit,
    super.key,
  });
  MyOrderCubit cubit;
  @override
  Widget build(BuildContext context) {
    return
      ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder:(context,index)
        {
          return Container(
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
                    Text("${cubit.pastorderResponse!.data!.items![index].id}",
                        style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                    Expanded(child: SizedBox()),

                    Text("${cubit.pastorderResponse!.data!.items![index].grandTotalAfterDeposit} EGP",
                        style: TextStyle(color: AppStyle.primaryColor, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      maxLines:1 ,
                      "Order Status :  ".tr(),
                      style: TextStyle(
                          color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text("${cubit.pastorderResponse!.data!.items![index].status}".tr(),
                        style: TextStyle(color: AppStyle.redColor, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,),
                    SizedBox(width: MediaQuery.of(context).size.width*.27,),
                  ],
                ),
                Text(
                  "${cubit.pastorderResponse!.data!.items![index].date} ",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 23,),
                cubit.pastorderResponse!.data!.items![index].statusKey=="Delivered"?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        // MagicRouter.navigateTo(OrderTrackingPage());
                        showModalBottomSheet(
                            isScrollControlled: true,

                            context: context, builder: (context){

                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: RatingPage(),
                          );
                            });

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*.37,
                        height: 40,
                        decoration: BoxDecoration(color: AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rate".tr(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 15),),

                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        var item=cubit.pastorderResponse!.data!.items![index];

                        MagicRouter.navigateTo(ReturnOrderReasonPage(item ));
                      print(cubit.pastorderResponse!.data!.items![index].toJson());
                        },
                      child: Container(

                        width: MediaQuery.of(context).size.width*.37,
                        height: 40,
                        decoration: BoxDecoration(color:  Colors.white,borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("return order".tr(),
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
                ):SizedBox()
                // InkWell(
                //   child: Container(
                //
                //     width: double.infinity,
                //     height: 40,
                //     decoration: BoxDecoration(color:  AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text("Re order".tr(),
                //           style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,fontSize: 15),),
                //
                //       ],
                //     ),
                //   ),
                // )



              ],
            ),
          ),
        );},
        itemCount: cubit.pastorderResponse!.data!.items!.length,
        separatorBuilder: (context,index){
          return SizedBox(height: 7,);
        },
      );
  }
}
