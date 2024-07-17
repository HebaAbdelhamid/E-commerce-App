import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/BottonSheet/botton_sheet_productDetails.dart';
import 'package:yiki1/common_component/Custom_sub_header_home.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_item_card.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';

import 'product_search_cubit.dart';
import 'product_search_state.dart';

class ProductSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProductSearchCubit()..fetchCategoryProduct(),
      child: BlocBuilder<ProductSearchCubit, ProductSearchState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<ProductSearchCubit>(context);
    return   Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 18),
          child:state is LoadingCategoryState? CustomLoading(): Column(
            children: [
              CustomAuthenticationHeader(),
              SizedBox(height: 17,),
              SizedBox(
                width: MediaQuery.of(context).size.width*.86,
                child: CustomTextField(
                  onChanged: (value){
                    cubit.name.text=value;
                    cubit.fetchCategoryProduct();
                    // print(cubit.name.text);
                  },
                  radius: 5,
                  isNext: true,
                  prefixIcon: const Padding(
                    padding:
                    EdgeInsets.only(left: 19.0, right: 7),
                    child: Icon(Iconic.search),
                  ),
                  hint: 'What are you looking for ?'.tr(),
                  hintColor: AppStyle.greyColor,
                  controller: cubit.name,
                  keyboardType: TextInputType.emailAddress,

                ),
              ),
              cubit.categoryProductResponse==null?
              Text("No search exist") : Expanded(
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
                      var id=  cubit.categoryProductResponse!.data!.items![index].id;

                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled:true,
                              context: context,
                              builder: (context) {
                                return  ProductDetailsBottonSheet(id_: id!,);
                              });
                        },
                        child: CustomItemCard(
                            id:cubit.categoryProductResponse!.data!.items![index].id.toString(),
                            image: 'assets/images/Rectangle 12349.png',
                            oldPrice: cubit.categoryProductResponse!.data!.items![index].price.toString(),
                            price: cubit.categoryProductResponse!.data!.items![index].priceAfterDiscount.toString(),
                            title: cubit.categoryProductResponse!.data!.items![index].name.toString(),
                            function:() {
                              cubit.addToCart(
                                id: cubit.categoryProductResponse!.data!.items![0].id
                                    .toString(),
                                count: cubit.getItemCount(id!).toString(),
                              );
                            }
                          // cubit.addToCart(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }

}


