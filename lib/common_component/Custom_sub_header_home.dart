import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/common_component/custom_text_field.dart';
import 'package:yiki1/core/styles.dart';

class CustomSubHeaderHome extends StatelessWidget {
   CustomSubHeaderHome({
     required this.function
  });
  Function()function;

  @override
  Widget build(BuildContext context) {
    return
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*.88,
          child: CustomTextField(
            onTap: function,
            radius: 5,
            isNext: true,
            prefixIcon: const Padding(
              padding:
              EdgeInsets.only(left: 19.0, right: 7),
              child: Icon(Iconic.search),
            ),
            hint: 'What are you looking for ?'.tr(),
            hintColor: AppStyle.greyColor,
            // controller: controller.email,
            keyboardType: TextInputType.emailAddress,

          ),
        ),
        // Container(
        //     width: 44,
        //     height: 45,
        //     decoration: BoxDecoration(color:AppStyle.primaryColor,borderRadius: BorderRadius.circular(5) ),
        //     child:IconButton(
        //       icon:Icon(Iconic.settings_sliders,color: Colors.white.withOpacity(.7), ),onPressed: function,
        //     )
        // ),
      ],
    );
  }
}
