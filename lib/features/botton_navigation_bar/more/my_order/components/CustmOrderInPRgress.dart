import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/components/CustmOrderInInDelivered.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/more/order%20_details/order%20_details_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/order_tracking/order_tracking_view.dart';

class CustmorderInPRogress extends StatelessWidget{
  CustmorderInPRogress(this. cubit);
  MyOrderCubit cubit;
  @override
  Widget build(BuildContext context) {
   return cubit.orderResponse!.data!.items!.isEmpty?Center(child: Text("No Order exist")):
   SizedBox(
     height: 700,
     child:
     ListView.separated(
       physics: BouncingScrollPhysics(),
         itemBuilder: (context,index){
       return
         // cubit.orderResponse!.data!.items![index].status=="in_delivery"?

         InkWell(
         onTap: (){
           var id=cubit.orderResponse!.data!.items![index].id;
           MagicRouter.navigateTo(OrderDetailsPage(id));

         },
         child: Container(
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
                     Text("${cubit.orderResponse!.data!.items![index].id}",
                         style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                     Expanded(child: SizedBox()),

                     Text("${cubit.orderResponse!.data!.items![index].grandTotalAfterDeposit} EGP",
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
                     Expanded(
                       child: Text("${cubit.orderResponse!.data!.items![index].status}".tr(),
                           style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                     ),
                     // SizedBox(width: MediaQuery.of(context).size.width*.27,),
                   ],
                 ),
                 Text(
                   // maxLines: 1,
                   "${cubit.orderResponse!.data!.items![index].date}",
                   style: TextStyle(
                       color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                overflow: TextOverflow.ellipsis, ),
                 SizedBox(height: 23,),

                 cubit.orderResponse!.data!.items![index].statusKey=="in_delivery"?
                InkWell(
                onTap: (){
                MagicRouter.navigateTo(OrderTrackingPage());
                },
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(color: AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Track".tr(),
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,fontSize: 15),),

                ],
                ),
                ),
                ):
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [

                     InkWell(
                       onTap: (){
                         MagicRouter.navigateTo(OrderTrackingPage());
                       },
                       child: Container(
                         width: MediaQuery.of(context).size.width*.37,
                         height: 40,
                         decoration: BoxDecoration(color: AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Track".tr(),
                               style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,fontSize: 15),),

                           ],
                         ),
                       ),
                     ),
                     InkWell(
                       onTap: (){
                        var id= cubit.orderResponse!.data!.items![index].id;
                         cubit.postCancelOrders(id);
                       },
                       child: Container(

                         width: MediaQuery.of(context).size.width*.37,
                         height: 40,
                         decoration: BoxDecoration(color:  Colors.white,borderRadius: BorderRadius.circular(5)),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text("Cancel order".tr(),
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
                 )


               ],
             ),
           ),
         ),
       );

     }, separatorBuilder: (context,index){
       return                   SizedBox(height: 13,);

     }, itemCount: cubit.orderResponse!.data!.items!.length),
   );
    //  Container(
    //   decoration:BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(5)) ,
    //   child: Padding(
    //     padding: const EdgeInsets.all(17),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Text(
    //               "Order no. : ".tr(),
    //               style: TextStyle(
    //                   color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
    //             ),
    //             Text("${cubit.orderResponse!.data!.items![0].id}",
    //                 style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
    //             Expanded(child: SizedBox()),
    //
    //             Text("2500 EGP",
    //                 style: TextStyle(color: AppStyle.primaryColor, fontWeight: FontWeight.bold)),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Text(
    //               "Order Status :  ".tr(),
    //               style: TextStyle(
    //                   color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
    //             ),
    //             Text("In  Progress".tr(),
    //                 style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
    //             SizedBox(width: MediaQuery.of(context).size.width*.27,),
    //           ],
    //         ),
    //         Text(
    //           "Sunday , 12 Nov 2023  ",
    //           style: TextStyle(
    //               color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
    //         ),
    //         SizedBox(height: 23,),
    //         Container(
    //
    //           // width: MediaQuery.of(context).size.width*.37,
    //           height: 40,
    //           decoration: BoxDecoration(color: AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text("Track".tr(),
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,fontSize: 15),),
    //
    //             ],
    //           ),
    //         )
    //
    //
    //       ],
    //     ),
    //   ),
    // );
  }

}