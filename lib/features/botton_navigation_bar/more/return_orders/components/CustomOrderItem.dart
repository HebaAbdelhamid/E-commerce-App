import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_order_details/return_order_details_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_orders/return_orders_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_orders/return_orders_state.dart';

class CustomOrderItem extends StatelessWidget {
   CustomOrderItem(this. cubit, {
    super.key,
  });
  ReturnOrdersCubit cubit;
  @override
  Widget build(BuildContext context) {
    // cubit.orderResponse!.data!.items![0].id;
    return
      BlocBuilder<ReturnOrdersCubit, ReturnOrdersState>(
  builder: (context, state) {

    return state is LoadingState?CustomLoading(): SizedBox(
        height: MediaQuery.of(context).size.height*.6,
        child: ListView.separated(
          itemBuilder: (context,index)
          { var item=cubit.returnOrderResponse!.data!.items![index];
            return InkWell(
            onTap: (){
              cubit.getReturnOrders();
              var itemId = cubit.returnOrderResponse!.data!.items![index].id;
print(itemId);
              MagicRouter.navigateTo(ReturnOrderDetailsPage(cubit:cubit,index:index,itemId: itemId));

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
                        Text("#${cubit.returnOrderResponse!.data!.items![index].id??""}",
                            style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                        Expanded(child: SizedBox()),
                        Text("${cubit.returnOrderResponse!.data!.items![index].grandTotal??""} EGP",
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
                        Text(" ${cubit.returnOrderResponse!.data!.items![index].status??""}",
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        SizedBox(width: MediaQuery.of(context).size.width*.27,),
                      ],
                    ),
                    Text(
                      "${cubit.returnOrderResponse!.data!.items![index].returnDate??""}",
                      style: TextStyle(
                          color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(height: 23,),



                  ],
                ),
              ),
            ),
          );},itemCount: cubit.returnOrderResponse!.data!.items!.length??1,
          separatorBuilder: (context,index){
            return SizedBox(height: 5,);
          },
        ),
      );
  },
);
  }
}
