import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yiki1/common_component/BottonSheet/app_language.dart';
import 'package:yiki1/common_component/custom_home_header.dart';
import 'package:yiki1/common_component/custom_more_item.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/cart/cart_view.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/category/category_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/about/about_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/account_setting/account_setting_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/app_language/app_language_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/contact_as/contact_as_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/delivery_address/delivery_address_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/discount_counpons/discount_counpons_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/flashSale/favourite_product_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/loyalty_points/loyalty_points_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_orders/return_orders_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/shared_applicaton/shared_applicaton_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/signout/sign_out_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/terms_conditions/terms_conditions_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/wallet/wallet_view.dart';
import 'package:yiki1/features/favourite_product/favourite_product_view.dart';
import 'package:yiki1/features/google_map/add_new_address/add_new_address_view.dart';
import 'package:yiki1/features/new_offer/new_offer_view.dart';

import 'more_cubit.dart';
import 'more_state.dart';

class MorePage extends StatelessWidget {
  List itemTitle = [
    "Account Settings",
    "My Orders",
    "Return Orders",
    "Delivery Addresses",
    "Favorite Products",
    "Flash Sale",
    "My Wallet",
    "Loyalty Points",
    "Discount Coupons",
    "App Language",
    "Terms&Conditions",
    "About the App",
    "Share With Frinds",
    "Contact Us",
    "Signout",
  ];
  List itemImage = [
    "Settings.png",
    "box-time.png",
    "box-time.png",
    "Point On Map.png",
    "i.png",
    "Tag.png",
    "a2.png",
    "ii.png",
    "iii.png",
    "iiii.png",
    "Sticker Circle.png",
    "iiiii.png",
    "iiiiiiiiii.png",
    "Chat Round Line.png",
    "iiiiiiii.png"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MoreCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<MoreCubit>(context);

    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
                child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      CustomHomeHeader(),
                      Divider(
                        color: AppStyle.primaryColor,
                      ),
                      // Expanded(
                      //   child: ListView.separated(itemBuilder:(context,index) {
                      //     return
                      //     InkWell(
                      //       onTap: (){},
                      //         child:
                      //         CustomMoreItem(image:"assets/images/${itemImage[index]}" ,text: "${itemTitle[index]}", function: () {
                      //           showModalBottomSheet(context: context, builder: (context){
                      //             return AppLanguagePage();
                      //           });
                      //         },),),;
                      //     },
                      //   itemCount: itemImage.length,
                      //     separatorBuilder: (context,index)=>SizedBox(height: 5,),
                      //   ),
                      //

                      CustomMoreItem(
                        image: "assets/images/Settings.png",
                        text: "Account Settings".tr(),
                        function: () {
                          MagicRouter.navigateTo(Account_settingPage());

                        },
                      ),

                      CustomMoreItem(
                        image: "assets/images/box-time.png",
                        text: "My Orders".tr(),
                        function: () {
                          MagicRouter.navigateTo(MyOrderPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/box-time.png",
                        text: "Return Orders".tr(),
                        function: () {
                          MagicRouter.navigateTo(ReturnOrdersPage());
                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/Point On Map.png",
                        text: "Delivery Addresses".tr(),
                        function: () {
                          MagicRouter.navigateTo(AddNewAddressPage());

                          // MagicRouter.navigateTo(Delivery_addressPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/i.png",
                        text: "Favorite Products".tr(),
                        function: () {
                          MagicRouter.navigateTo(FavouriteProductPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/Tag.png",
                        text: "Flash Sale".tr(),
                        function: () {
                          MagicRouter.navigateTo(NewOfferPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/a2.png",
                        text: "My Wallet".tr(),
                        function: () {
                          MagicRouter.navigateTo(WalletPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/ii.png",
                        text: "Loyalty Points".tr(),
                        function: () {
                        MagicRouter.navigateTo(LoyaltyPointsPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/iii.png",
                        text: "Discount Coupons".tr(),
                        function: () {
                         MagicRouter.navigateTo(Discount_counponsPage());
                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/iiii.png",
                        text: "App Language".tr(),
                        function: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return AppLanguagePage();
                              });
                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/Sticker Circle.png",
                        text: "Terms&Conditions".tr(),
                        function: () {
                          MagicRouter.navigateTo(TermsConditionsPage());
                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/iiiii.png",
                        text: "About the App".tr(),
                        function: () {
                        // AboutPage
                          MagicRouter.navigateTo(AboutPage());

                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/iiiiiiiiii.png",
                        text: "Share With Frinds".tr(),
                        function: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Shared_ApplicationPage();
                              });
                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/Chat Round Line.png",
                        text: "Contact Us".tr(),
                        function: () {
                          MagicRouter.navigateTo(Contact_asPage());
                        },
                      ),
                      CustomMoreItem(
                        image: "assets/images/iiiiiiii.png",
                        text: "Signout".tr(),
                        function: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Sign_outPage();
                              });
                        },
                      ),
                    ]))));
  }
}
