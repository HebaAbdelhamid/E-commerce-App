import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/category/category_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/catrgories/category/category_state.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';

class ProductDetailsBottonSheet extends StatelessWidget {
   ProductDetailsBottonSheet(  {
    required this. id_,
    super.key,
  });
   int id_;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => CategoryCubit()..fetchProduct(id_??1),
  child: BlocBuilder<CategoryCubit, CategoryState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<CategoryCubit>(context);
    // final id=cubit.categoryProductResponse!.data!.items![0].id;

    return state is LoadingCategoryState ||cubit.showProductResponse==null?CustomLoading():
      ListView(
        shrinkWrap: true,

        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 65,),
              IconButton(onPressed: (){
                MagicRouter.pop();
              }, icon: Icon(Icons.close,color: Colors.red,size: 17,)
              ),

            ],
          ),
          Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 263,
                    child: PageView(
                      controller: cubit.pageController,
                      onPageChanged: (int index) {
                       cubit.selectedIndex_(index);
                      },
                      children: [
                        Image.asset(
                          "assets/images/Rectangle 12349.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 263,
                        ),
                        Image.asset(
                          "assets/images/Rectangle 797 (1).png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 263,
                        ),
                        Image.asset(
                          "assets/images/Rectangle 12349.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 263,
                        ),
                        Image.asset(
                          "assets/images/Rectangle 797 (1).png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 263,
                        ),
                        Image.asset(
                          "assets/images/Rectangle 12349.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 263,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 88.0),
                        child: DotsIndicator(

                          dotsCount: 5,
                          position:cubit. currentIndex,
                          decorator: DotsDecorator(
                            activeColor:AppStyle.primaryColor, // Change to AppStyle.mainColor1 if defined
                            size: const Size.square(9.0),
                            activeSize: const Size(9.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),),)
                    ]
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height*.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        cubit.previousPage();
                      }, icon:  Icon(Iconic.angle_left)),
                      SizedBox(width: MediaQuery.of(context).size.width*.77,),
                      IconButton(onPressed: (){
                        cubit.nextPage();

                      }, icon: Icon(Iconic.angle_right)),

                    ],
                  ),
                )
              ]
          )
          ,SizedBox(height:17 ,),
          Center(child: Text("${cubit.showProductResponse!.data!.name}",style: TextStyle(color: AppStyle.blackColor,fontSize: 16,fontWeight: FontWeight.bold),)),
          SizedBox(height:20 ,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: Colors.grey.withOpacity(.5),thickness: 1,),
                Row(
                  children: [
                    Text("Qty :",
                      style: TextStyle(color: AppStyle.lightBlackColor,fontSize: 13,fontWeight: FontWeight.bold),),
                    SizedBox(width: 7,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xffdedcdc).withOpacity(.7)
                      ),
                      height: 55,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: (){

                                    cubit.decreament(id_);
                                    print("object");
                                  
                                },
                                child: PriceCount(title: '-',color:  Color(0xffdedcdc).withOpacity(.4),width: 34,)),
                            PriceCount(
                              title: cubit.getItemCount( id_).toString(),
                              color:Color(0xffdedcdc).withOpacity(.4),
                              width: 34,),
                            InkWell(
                                onTap: (){
                                  print(cubit.count);
                                  cubit.increament(id_);
                                  // setState(() {
                                  //   count=count+1;
                                  //
                                  // });

                                },
                                child: PriceCount(title: '+',color: Color(0xffdedcdc).withOpacity(.4),width: 34,)),



                          ],
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()) ,
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(color: AppStyle.primaryColor,borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text("Body Care",style: TextStyle(color: Colors.white),)),
                    )


                  ],
                ),
                Divider(color: Colors.grey.withOpacity(.5),thickness: 1,),


                SizedBox(height: 17,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Details",
                      style: TextStyle(color: AppStyle.blackColor,fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    Text("Out of Stock",style: TextStyle(color:Colors.red,fontSize: 13,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 17,),

                Text("${parse(cubit.showProductResponse!.data!.description).body!.text}",style: TextStyle(color: AppStyle.lightBlackColor,fontSize: 13),),




                SizedBox(height: 20,)

              ],
            ),
          ),
          Container(
            // width: MediaQuery.of(context).size.width,
            height: 50,
            color: Colors.grey.withOpacity(.2),
            child: Center(
              child: RichText(
                text: TextSpan(
                    children:[
                      TextSpan(
                        text: "Price :",
                        style: TextStyle(
                            color: AppStyle.lightBlackColor,fontSize: 13),
                      ),
                      TextSpan(
                        text: "${cubit.showProductResponse!.data!.price} EGP",
                        style: TextStyle(
                            color: AppStyle.primaryColor,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "|",
                        style: TextStyle(
                            color: AppStyle.primaryColor,fontSize: 22,fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: " Total Price : ",
                        style: TextStyle(
                            color: AppStyle.lightBlackColor,fontSize: 15),
                      ),
                      TextSpan(
                        text: "${cubit.showProductResponse!.data!.priceAfterDiscount} EGP",
                        style: TextStyle(
                            color: AppStyle.primaryColor,fontSize: 15,fontWeight: FontWeight.bold),
                      ),

                    ]
                ),


              ),
            ),
          ),

          Container(
            // width: MediaQuery.of(context).size.width,
              height: 50,
              color: AppStyle.primaryColor,
              child:state is LoadingState?Padding(
                padding: const EdgeInsets.symmetric(horizontal: 180.0,vertical: 10),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ): Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconic.shopping_cart,color: Colors.white,),
                  SizedBox(width: 5,) ,
                  TextButton(child: Text("Add to Cart".tr(),style:  TextStyle(
                      color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                    onPressed: (){
                    cubit.addToCart(id: id_.toString(),
                      count: cubit.getItemCount(id_)
                    );
                    // cubit.addToCart(id: id)
                    },
                  )
                ],
              )),



        ]
    );
  },
),
);
  }
  
}

