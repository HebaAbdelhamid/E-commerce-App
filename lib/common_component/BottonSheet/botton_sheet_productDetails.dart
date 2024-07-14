import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';

class ProductDetailsBottonSheet extends StatefulWidget {
   ProductDetailsBottonSheet( {
    super.key,
  });
  @override
  State<ProductDetailsBottonSheet> createState() => _ProductDetailsBottonSheetState();
}

class _ProductDetailsBottonSheetState extends State<ProductDetailsBottonSheet> {
  final PageController pageController = PageController();
  int count=1;

  int currentIndex=0;
  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
void previousPage() {
  pageController.previousPage(
    duration: Duration(milliseconds: 300),
    curve: Curves.easeInOut,
  );
}

  @override
  Widget build(BuildContext context) {
    return  ListView(
        shrinkWrap: true,

        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                      controller: pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          currentIndex = index;
                        });
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
                          position: currentIndex,
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
                        previousPage();
                      }, icon: Icon(Iconic.angle_right)),
                  SizedBox(width: MediaQuery.of(context).size.width*.77,),
                      IconButton(onPressed: (){
                        nextPage();
                      }, icon: Icon(Iconic.angle_left)),

                    ],
                  ),
                )
              ]
          )
          ,SizedBox(height:17 ,),
          Center(child: Text("Deodorant white mesk",style: TextStyle(color: AppStyle.blackColor,fontSize: 16,fontWeight: FontWeight.bold),)),
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
                                setState(() {
                                  count-=count-1;

                                });
                              },
                                child: PriceCount(title: '-',color:  Color(0xffdedcdc).withOpacity(.4),width: 34,)),
                            PriceCount(title: '$count',color:Color(0xffdedcdc).withOpacity(.4),width: 34,),
                            InkWell(
                              onTap: (){

                                  setState(() {
                                    count=count+1;

                                  });

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

                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do "
                    "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim "
                    "veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo "
                    "consequat. Duis aute irure dolor in reprehenderit "
                    "in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Ut enim ad minim veniam,"
                    " quis nostrud exercitation ul.",style: TextStyle(color: AppStyle.lightBlackColor,fontSize: 13),),




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
                        text: " 850 EGP",
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
                        text: " 850 EGP",
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconic.shopping_cart,color: Colors.white,),
                  SizedBox(width: 5,) ,
                  Text("Add to Cart".tr(),style:  TextStyle(
                      color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                ],
              )),



        ]
    );
  }
}
