import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/BottonSheet/FilterBottonSheet.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/BottonSheet/botton_sheet_productDetails.dart';
import 'package:yiki1/common_component/category_name.dart';
import 'package:yiki1/common_component/customCarouselSlider.dart';
import 'package:yiki1/common_component/custom_button.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/common_component/sub_page_header.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/utils/utils.dart';

import 'new_offer_cubit.dart';
import 'new_offer_state.dart';

class NewOfferPage extends StatelessWidget {
  List categoryName=["All","Hair Care","Body Care"];
  List <Color>color=[AppStyle.primaryColor,Colors.grey.withOpacity(.1),Colors.grey.withOpacity(.1) ];
  List <Color>textColor=[Colors.white,AppStyle.lightBlackColor,AppStyle.lightBlackColor,];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewOfferCubit()..fetchCategory()..fetchCategoryProduct(category_id: "1"),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<NewOfferCubit>(context);

    return BlocBuilder<NewOfferCubit, NewOfferState>(
      builder: (context, state) {
        final controller = BlocProvider.of<NewOfferCubit>(context);

        return Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 17),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubPageHeader(),
                          const SizedBox(height: 7,),
                          const Text("Flash Sale",
                            style: TextStyle(
                                color: AppStyle.blackColor,
                                fontWeight: FontWeight.bold,fontSize: 20),),
                          const SizedBox(height: 7,),
                           Text("Browse Our Flash sale Products".tr(),
                            style: TextStyle(
                                color: Color(0XFFA2A2A3),
                                fontWeight: FontWeight.bold,fontSize: 12),),
                          const SizedBox(height: 17,),

                          CustomSubHeaderHome(function: (){
                            print(cubit.categoryResponse!.data!.items![0].name);
                            showModalBottomSheet(
                                context: context, builder: (context){
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: const FilterBottonSheet(),
                              );
                            });
                          },),
                          const SizedBox(height: 11,),
                          const Divider(color: AppStyle.primaryColor,),
                          const SizedBox(height: 11,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child:state is LoadingCategoryNameState ||cubit.categoryResponse==null?Center(child: Text("Loading......",style: TextStyle(fontWeight: FontWeight.bold),)):
                            ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: CustomCategoryName(
                                          color1: cubit.selectedIndex==index?AppStyle.primaryColor:Colors.white,
                                          color2: cubit.selectedIndex==index?Colors.white:AppStyle.primaryColor,
                                          text: cubit.categoryResponse!.data!.items![index].name.toString(),
                                          width: MediaQuery.of(context).size.width * .4,
                                        ),
                                        onTap: (){
                                          cubit.changeSelectedIndex(index);
                                          cubit.fetchCategoryProduct(category_id: cubit.categoryResponse!.data!.items![index].id);
                                          // print(cubit.categoryResponse!.data!.items!.length);
                                          // //4
                                          // print(cubit.categoryResponse!.data!.items![3].name);

                                        },
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                    ]);
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          state is LoadingCategoryState ||cubit.categoryProductResponse==null?CustomLoading():
                          Expanded(
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                // itemCount: 1,
                                itemCount: cubit.categoryProductResponse!.data!.items!.length??1,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 5,
                                    childAspectRatio: 1 / 1.6),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      // showModalBottomSheet(
                                      //     context: context,
                                      //     builder: (context) {
                                      //       return  ProductDetailsBottonSheet(cubit as HomeCubit);
                                      //     });
                                    },
                                    child: CustomItemCard(
                                        id:cubit.categoryProductResponse!.data!.items![index].id.toString(),
                                        image: 'assets/images/Rectangle 12349.png',
                                        oldPrice: cubit.categoryProductResponse!.data!.items![index].price.toString(),
                                        price: cubit.categoryProductResponse!.data!.items![index].priceAfterDiscount.toString(),
                                        // count: 1,
                                        title: cubit.categoryProductResponse!.data!.items![index].name.toString(),
                                        function:() {
                                          cubit.addToCart(
                                            id: cubit.categoryProductResponse!.data!.items![0].id
                                                .toString(),
                                            count: "cubit.getItemCount(id).toString()",
                                          );
                                        }
                                      // cubit.addToCart(),
                                    ),
                                  );
                                }),
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: 60,
                          //   child: ListView.builder(
                          //     itemCount: categoryName.length,
                          //     itemBuilder: (context,index){
                          //       return InkWell(
                          //         onTap: (){
                          //
                          //         },
                          //         child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               CustomCategoryName(color1:color[index],
                          //                 color2: textColor[index],
                          //
                          //                 text:categoryName[index] ,
                          //                 width: MediaQuery.of(context).size.width*.3,
                          //               ),
                          //               const SizedBox(width: 7,),]),
                          //       );
                          //     },
                          //     scrollDirection: Axis.horizontal,
                          //
                          //   ),
                          // ),
                          // const SizedBox(height: 11,),
                          // Expanded(
                          //   child: GridView.builder(
                          //       scrollDirection: Axis.vertical,
                          //       itemCount: 9,
                          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //           crossAxisCount: 2,
                          //           crossAxisSpacing: 2,
                          //           mainAxisSpacing: 5,
                          //           childAspectRatio: 1/1.6
                          //
                          //       ), itemBuilder:(context,index)
                          //   {
                          //     return InkWell(
                          //       onTap: (){
                          //        Utils.showBottonSheet(context);
                          //       },
                          //       child: CustomItemCard(image: 'assets/images/Rectangle 12349.png',
                          //         oldPrice: '180.00',
                          //         price: '150.00',
                          //         // count: 1,
                          //         title: "keratin Serum",
                          //         id:"id"
                          //       ),
                          //     );}),
                          // ),


                        ]
                    )
                )
            ));
     },
     );
  }
}


class CustomItemWithRadio extends StatelessWidget {
   CustomItemWithRadio({
     required this.title,
     required this. group,
      this.function
  });
String title;
String group;
Function? function ;
  @override
  Widget build(BuildContext context) {
  //   return BlocBuilder<NewOfferCubit, NewOfferState>(
  // builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            style: TextStyle(
                color: AppStyle.lightBlack,
                fontSize: 13),),
          Radio(

              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

              focusColor: Colors.grey,
              value: title, groupValue: "state.selectedValue", onChanged: (value){
            // context.read<NewOfferCubit>().selectValue(value as String? );


          })
        ],
      ),
    );
//   },
// );
  }
}



