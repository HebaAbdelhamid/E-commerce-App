import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'cart_cubit.dart';
import 'cart_state.dart';
import 'complete_order/complete_order_view.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CartCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomHomeHeader(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Shopping Cart".tr(),
                    style: TextStyle(
                        color: AppStyle.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    "Browse your cart and complete checkout.".tr(),
                    style: TextStyle(
                        color: Color(0XFFA2A2A3),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const Divider(
                    color: AppStyle.primaryColor,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartItem(
                        image: "Rectangle 12349.png",
                        title: "keratin Serum",
                        price: "360.00",
                        count: 2,
                      );
                    },
                    itemCount: 2,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 17,
                      );
                    },
                  ),
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
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff252525),
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  CustomTextField(
                    multiLine: true,
                    radius: 5,
                    isNext: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 19.0, right: 7),
                      child: SvgPicture.asset('assets/images/Vector1.svg'),
                    ),
                    hint: 'Write message here ...'.tr(),
                    hintColor: AppStyle.greyColor,
                    // controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    // validator: (value) => Validate.vaidateEmail(value),
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
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: CustomButton(
                      title: "Continue to checkout",
                      function: () {
                        MagicRouter.navigateTo(ChooseAddressPage());
                      },
                      bgColor: AppStyle.primaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
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
    return
      Row(
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

class CartItem extends StatefulWidget {
  CartItem({
    required this.image,
    required this.title,
    required this.price,
    required this.count,
  });

  String image;
  String title;
  String price;
  int count;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppStyle.primaryColor,
              borderRadius: BorderRadius.circular(7)),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      widget.count=widget.count+1;

                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Text(
               "${ widget.count}",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      if(widget.count>=1)
                      widget.count=widget.count-1;

                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  )),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .72,
          height: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/${widget.image}",
                  width: MediaQuery.of(context).size.width * .24,
                  height: MediaQuery.of(context).size.width * .3,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: 5,
                ),
                SizedBox(
                  height: 100,
                  width: 150,
                  child: ListTile(
                    title: Text(
                      widget.title,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Color(0xff252525),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Price:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff252525),
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: widget.price,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppStyle.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outlined,
                              color: AppStyle.redColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
