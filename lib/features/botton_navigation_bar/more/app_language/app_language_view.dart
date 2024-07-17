import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/core/change_languge.dart';
import 'package:yiki1/core/styles.dart';

import 'app_language_cubit.dart';
import 'app_language_state.dart';

class AppLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppLanguageCubit(),
        child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<AppLanguageCubit>(context);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.grey.withOpacity(.2)),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "App Language",
                          style: TextStyle(
                              color: AppStyle.blackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Choose your preference App Language",
                          style: TextStyle(
                              color: Color(0XFFA2A2A3),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    cubit.selesctedPayment(1);
                    cubit.changeLanguge(context, Locale('en'));
                    // LocalizationChecker.changeLanguge(context, Locale('en', ''));
                  },
                  child: SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/Vectoramerican(1).png",
                        width: 22,
                      ),
                      title: Text(
                        "English",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        cubit.selected == 0
                            ? 'assets/images/images.png'
                            : "assets/images/Group 4211.png",
                        width: 22,
                      ),
                    ),
                  ), //Group 4211.png
                ),
                InkWell(
                  onTap: () {
                    cubit.selesctedPayment(0);
                    cubit.changeLanguge(context, Locale('ar'));
                    // LocalizationChecker.changeLanguge(context, Locale('ar', ''));
                  },
                  child: SizedBox(
                    height: 60,
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/Saudi Arabia (SA).png",
                        width: 22,
                      ),
                      title: Text(
                        "Arabic",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppStyle.blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Image.asset(
                        cubit.selected == 0
                            ? 'assets/images/Group 4211.png'
                            : "assets/images/images.png",
                        width: 22,
                      ),
                    ),
                  ),
                ),

                // CustomListTilePayment(image: 'Saudi Arabia (SA).png', title: 'ttttttttt',)
              ],
            );
          },
        ));
  }
}

// class CustomLanguage extends StatelessWidget {
//    CustomLanguage({
//     super.key,
//     required this.cubit,
//      required this.image,
//      required this.title,
//      required this.function,
//      required this.selected
//   });
// String image;
// String title;
// Function()function;
//   final AppLanguageCubit cubit;
//   bool selected;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       InkWell(
//       onTap:function,
//       child: SizedBox(
//         height: 60,
//         child: ListTile(
//           leading:Image.asset("assets/images/$image",width: 22,) ,
//           title: Text(
//             "$title",
//             style: TextStyle(
//                 fontSize: 15,
//                 color: AppStyle.blackColor,
//                 fontWeight: FontWeight.bold),
//           ),
//           trailing: Image.asset(cubit.selected==0?'assets/images/Group 4211.png':"assets/images/images.png",width: 22,) ,
//         ),
//       ),
//     );
//   }
// }
