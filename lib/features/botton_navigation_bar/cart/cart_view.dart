import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_state.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/component/CartItem.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/component/shopingCart.dart';
import 'cart_cubit.dart';
import 'complete_order/complete_order_view.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartCubit()..fetchCartItems(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<CartCubit>(context);

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
              child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomHomeHeader(),
                            SizedBox(height: 10),
                            Text(
                              "Shopping Cart".tr(),
                              style: TextStyle(
                                  color: AppStyle.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 13),
                            Text(
                              "Browse your cart and complete checkout.".tr(),
                              style: const TextStyle(
                                  color: Color(0XFFA2A2A3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                           const Divider(
                                color: AppStyle.primaryColor, thickness: 2),
                            const SizedBox(height: 7),
                            state is LoadingCartState ||cubit.getCartResponse==null
                                ? CustomLoading() :
                            ShoppingCart(),
                            Divider(
                              color: Colors.grey.withOpacity(.4),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/Group 4212.svg",
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text("Buy as a gift ?".tr(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color(0xff252525),
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            CustomTextField(
                              controller: cubit.gift,
                              multiLine: true,
                              radius: 5,
                              isNext: true,
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 19.0, right: 7),
                                child: SvgPicture.asset(
                                    'assets/images/Vector1.svg'),
                              ),
                              hint: 'Write message here ...'.tr(),
                              hintColor: AppStyle.greyColor,
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Divider(
                              color: Colors.grey.withOpacity(.4),
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "No. Of Products",
                              priceColor: AppStyle.lightBlack,
                              price: "7",
                            ),
                            CartDetails(
                              titleColor: Colors.grey.withOpacity(.9),
                              title: "Price",
                              priceColor: AppStyle.lightBlack,
                              price: "810",
                            ),
                            CartDetails(
                              titleColor: AppStyle.primaryColor,
                              title: "Total Price",
                              priceColor: AppStyle.primaryColor,
                              price: "750",
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: CustomButton(
                                title: "Continue to checkout",
                                function: () {
                                  var gift=cubit.gift.text;
                                 print(cubit.gift.text) ;
                                  MagicRouter.navigateTo(ChooseAddressPage(gift));
                                },
                                bgColor: AppStyle.primaryColor,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}

///TODO
class CartDetails extends StatelessWidget {
  CartDetails(
      {super.key,
      required this.titleColor,
      required this.priceColor,
      required this.title,
      required this.price});

  Color titleColor;
  Color priceColor;
  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: titleColor, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        Text(price,
            style: TextStyle(color: priceColor, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
