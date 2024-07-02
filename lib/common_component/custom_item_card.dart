import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/Custom_home_price_count.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_state.dart';

class CustomItemCard extends StatelessWidget {
  CustomItemCard(
      {required this.image,
      required this.title,
      required this.oldPrice,
      required this.price,
      // required this.count
  });

  String image;

  String title;
  String oldPrice;
  String price;
  // int count;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit(),
  child: BlocBuilder<HomeCubit, HomeState>(
  builder: (context, state) {
    final cubit = BlocProvider.of<HomeCubit>(context);

    return Card(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/Rectangle 12349.png",
            width: MediaQuery.of(context).size.width * .47,
            height: MediaQuery.of(context).size.width * .39,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "keratin Serum",
                      style: TextStyle(
                          color: Color(0xff252525),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    IconButton(
                        onPressed: () {
cubit.selectedIcon_();
print("true===========");
                        },
                        icon: Icon(cubit.select?Iconic.heart_solid:
                          Iconic.heart,
                          color: Colors.red,
                          size: 17,
                        ))
                  ],
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Price:",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff252525),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "180.00:",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "150.00",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppStyle.primaryColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            child: PriceCount(
                              title: '-',
                              color: Colors.white,
                              width: 29,
                            ),
                            onTap: (){
                              if(cubit.count>1)
                              cubit.decreament();
                            },
                          ),
                          PriceCount(
                              title: cubit.count.toString(), color: Colors.white, width: 29),
                          InkWell(
                              onTap: (){

                                cubit.increament();
                              },
                              child: PriceCount(title: '+', color: Colors.white, width: 29))
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        width: 44,
                        height: 35,
                        decoration: BoxDecoration(
                            color: AppStyle.primaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: IconButton(
                          icon: const Icon(
                            Iconic.shopping_cart_add_solid,
                            size: 15,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  },
),
);
  }
}
