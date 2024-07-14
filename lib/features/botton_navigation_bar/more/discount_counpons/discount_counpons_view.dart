import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/more/discount_counpons/components/customItem.dart';
import 'package:yiki1/features/botton_navigation_bar/more/discount_counpons/discount_counpons_state.dart';
import 'discount_counpons_cubit.dart';
var copyValue;
class Discount_counponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => Discount_counponsCubit()..fetchCoupon(),
        child: Scaffold(
          backgroundColor: Colors.white,
            body: Padding(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
          child: ListView(children: [
            CustomAuthenticationHeader(),
            SizedBox(
              height: 10,
            ),
             Text(
              "Discount Coupons".tr(),
              style: TextStyle(
                  color: AppStyle.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 13,
            ),
             Text(
              " Use discount coupons and get discounts on your purchases.".tr(),
              style: TextStyle(
                  color: Color(0XFFA2A2A3),
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Divider(
              color: AppStyle.primaryColor,
              thickness: 2,
            ),
            SizedBox(
              height: 13,
            ),
            BlocBuilder<Discount_counponsCubit, Discount_counponsState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<Discount_counponsCubit>(context);
    return state is LoadingState?CustomLoading():
      SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(itemBuilder: (context,index){
                return   Container(
                  padding: EdgeInsets.only(left: 4,right: 0),
                  decoration: BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(7)),
                  child: ListTile(
                    leading: SizedBox(
                      width: MediaQuery.of(context).size.width*.16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/images/Group 1000000927.svg"),
                          // Container(width: 3,height: 108,color: AppStyle.primaryColor,)
                        ],
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${cubit.couponResponse!.data!.items![index].code}",style: TextStyle(color: AppStyle.primaryColor,fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,) ,Text("${cubit.couponResponse!.data!.items![index].value}",style: TextStyle(color: AppStyle.blackColor,fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,) ,  Text("${cubit.couponResponse!.data!.items![index].start}Valid until ${cubit.couponResponse!.data!.items![index].end}",style: TextStyle(color: AppStyle.blackColor,fontSize: 13,),),

                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Iconic.copy,color: AppStyle.primaryColor,),
                      onPressed: (){
                        copyValue=cubit.couponResponse!.data!.items![index].code;
                      },
                    ),
                  ),
                );
              }, separatorBuilder: (context,index){
                return SizedBox(height: 7,);
              }, itemCount: cubit.couponResponse!.data!.items!.length??1
              ),
            );
  },
)

          ]),
        )));
  }
}

