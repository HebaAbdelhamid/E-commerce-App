import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/order_tracking/order_tracking_view.dart';

class CustmOrderInReview extends StatelessWidget {
  const CustmOrderInReview({
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
                const Text("#46679797",
                    style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                Expanded(child: SizedBox()),
                const Text("2500 EGP",
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
                Text("In Review",
                    style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                SizedBox(width: MediaQuery.of(context).size.width*.27,),
              ],
            ),
            Text(
              "Sunday , 12 Nov 2023  ",
              style: TextStyle(
                  color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 23,),
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
                Container(

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
    );
  }
}
