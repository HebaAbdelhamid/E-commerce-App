import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rate/rate.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_view.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/complete_order/complete_order_state.dart';
import 'package:yiki1/features/botton_navigation_bar/more/components/customHeader.dart';
import 'package:yiki1/features/botton_navigation_bar/more/order%20_details/components/productItem.dart';
import 'order _details_cubit.dart';
import 'order _details_state.dart';

class OrderDetailsPage extends StatelessWidget {
  OrderDetailsPage(this.id);

  int? id;

  @override
  Widget build(BuildContext context) {
    var value_;
    return BlocProvider(
        create: (BuildContext context) =>
            OrderDetailsCubit()..getDetailsOrders(id),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
              builder: (context, state) {
                final cubit = BlocProvider.of<OrderDetailsCubit>(context);

                if (state is LoadingSate) return CustomLoading();
                if (state is ErrorState) return Text('Error occured');
                else {
                  return ListView(children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          CustomHeader(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Order Details".tr(),
                            style: TextStyle(
                                color: AppStyle.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Order No. $id",
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
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Order no. : ",
                                        style: TextStyle(
                                            color: Colors.grey.withOpacity(.9),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text("$id",
                                          style: const TextStyle(
                                              color: AppStyle.blackColor,
                                              fontWeight: FontWeight.bold)),
                                      const Expanded(
                                        child: SizedBox(
                                            // width: MediaQuery.of(context).size.width *
                                            //     .27,
                                            ),
                                      ),
                                      Text(" ${cubit.orderDetailsResponse!.data!.grandTotalAfterDeposit.toString()} EGP",
                                          style: TextStyle(
                                              color: AppStyle.primaryColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Order Status :  ".tr(),
                                        style: TextStyle(
                                            color: Colors.grey.withOpacity(.9),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Text("${cubit.orderDetailsResponse!.data!.status}".tr(),
                                          style: const TextStyle(
                                              color: AppStyle.blackColor,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Text(
                                    "${cubit.orderDetailsResponse!.data!.createdAt.toString()}",
                                    style: TextStyle(
                                        color: Colors.grey.withOpacity(.9),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 13
                          ),
                          Text(
                            "Products".tr(),
                            style: const TextStyle(
                                color: AppStyle.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            height: 13
                          ),
                          SizedBox(
                            height: 200,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ProductItem(
                                  image: "Rectangle 12349.png",
                                  title: "${cubit.orderDetailsResponse!.data!.items![index].productName}",
                                  price: "${cubit.orderDetailsResponse!.data!.items![index].price}",
                                  count: "${cubit.orderDetailsResponse!.data!.items![index].quantity}",
                                );
                              },
                              itemCount: cubit.orderDetailsResponse!.data!.items!.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 17,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 13
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(.4)
                          ),
                          SizedBox(
                            height: 13
                          ),
                          Text(
                            "Payment Method".tr(),
                            style: const TextStyle(
                                color: AppStyle.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          SizedBox(
                            height: 17
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          title: Text(
                                            "Payemnt Method :".tr(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey.shade600),
                                          ),
                                          subtitle: Text(
                                            "${cubit.orderDetailsResponse!.data!.paymentMethod}".tr(),
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: AppStyle.blackColor),
                                          ),
                                          trailing: Image.asset(
                                              "assets/images/image 8 (1).png"),
                                        )
                                      ]))),
                          SizedBox(
                            height: 13
                          ),
                          Divider(
                            color: Colors.grey.withOpacity(.4),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Text(
                            "Delivery Address".tr(),
                            style: TextStyle(
                                color: AppStyle.blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2),
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    leading: Column(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/Point On Map.svg",
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                    title: Text(
                                      "Home",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: AppStyle.blackColor),
                                    ),
                                    subtitle: Text(
                                      "${cubit.orderDetailsResponse!.data!.address!.city}  ${cubit.orderDetailsResponse!.data!.address!.country}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                            // left: BorderSide(color: AppStyle.primaryColor),
                            // right: BorderSide(color: AppStyle.primaryColor),
                            top: BorderSide(color: AppStyle.primaryColor),
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Summary".tr(),
                              style: TextStyle(
                                  fontSize: 13,
                                  color: AppStyle.blackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "No. Of Products",
                              priceColor: AppStyle.lightBlack,
                              price: "${cubit.orderDetailsResponse!.data!.productsCount}",
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "Price",
                              priceColor: AppStyle.lightBlack,
                              price: "${cubit.orderDetailsResponse!.data!.grandTotalAfterDeposit}",
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "Discount Coupon Value",
                              priceColor: AppStyle.lightBlack,
                              price: "${cubit.orderDetailsResponse!.data!.couponValue}",
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "Tax",
                              priceColor: AppStyle.lightBlack,
                              price: "${cubit.orderDetailsResponse!.data!.actualShippingFees}",
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "shipping fees",
                              priceColor: AppStyle.lightBlack,
                              price: "${cubit.orderDetailsResponse!.data!.shippingFees}",
                            ),
                            CartDetails(
                              titleColor: AppStyle.primaryColor,
                              title: "Total Price",
                              priceColor: AppStyle.primaryColor,
                              price: "${cubit.orderDetailsResponse!.data!.grandTotal}",
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
    showModalBottomSheet(
    isScrollControlled: true,

    context: context, builder: (context){

    return Padding(
    padding: MediaQuery.of(context).viewInsets,

    child:  Container(
      width: double.infinity,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [

          SizedBox(
            height: 17,
          ),
          Text(
            "Rate Order".tr(),
            style: TextStyle(
                color: AppStyle.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 17),textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "Share your experince with us".tr(),
            style: TextStyle(
                color: Color(0XFFA2A2A3),
                fontWeight: FontWeight.bold,
                fontSize: 13),
          ),
          SizedBox(
            height: 17,
          ),
          Rate(
            iconSize: 40,
            color: Color(0xffFFD700),
            allowHalf: true,
            allowClear: true,
            initialValue: 3.5,
            readOnly: false,
            onChange: (value) {
              value_=value;
              print(value);
            },
          ),
          SizedBox(
            height: 17
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0),
            child: CustomTextField(
              multiLine: true,
              radius: 5,
              isNext: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 19.0, right: 7),
                child: SvgPicture.asset('assets/images/Vector1.svg'),
              ),
              hint: 'Write message here ...'.tr(),
              hintColor: AppStyle.greyColor,
              controller: cubit.text,
              keyboardType: TextInputType.emailAddress,
              // validator: (value) => Validate.vaidateEmail(value),
            ),
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap:(){
                  print(value_);
cubit.addRate(cubit.orderDetailsResponse!.data!.id,value_);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .37,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppStyle.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rate ".tr(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),  InkWell(
                onTap:(){
                  MagicRouter.pop();

                },
                child: Container(
                  width: MediaQuery.of(context).size.width * .37,
                  height: 40,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5),border: Border.all(color: AppStyle.primaryColor )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Back".tr(),
                        style: TextStyle(
                            color:  AppStyle.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 17,
          ),

          // Text(
          //   "Share Us Your Review ",
          //   textAlign: TextAlign.start,
          //   style: TextStyle(
          //       color: AppStyle.blackColor,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 17),
          // ),




        ],
      ),
    )
    );});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .37,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: AppStyle.primaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Rate Order".tr(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    cubit.postCancelOrders(id);
                                    // MagicRouter.navigateTo(OrderTrackingPage());
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * .37,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppStyle.redColor)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Cancel order".tr(),
                                          style: TextStyle(
                                              color: AppStyle.redColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
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
                            // CustomButton(
                            //   bgColor: AppStyle.primaryColor,
                            //   textColor: Colors.white,
                            //   title: "Checkout",
                            //   function: () {
                            //     Utils.completeOrder(context);
                            //     // Utils.verifyAccount(context);
                            //   },
                            // ),
                            SizedBox(
                              height: 17,
                            ),
                          ],
                        ),
                      ),
                    )
                  ]);
                }
              },
            )));
  }
}
