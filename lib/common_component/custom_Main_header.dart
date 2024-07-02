import 'package:flutter/material.dart';
import 'package:yiki1/core/styles.dart';

class CustomeMainHeader extends StatelessWidget{
  late String mainTitle;
  late String subTitle1;
  late String subTitle2;
  final   Function() function;
  CustomeMainHeader({
    required this.mainTitle,
    required this.subTitle1,
    required this.subTitle2,
  required this.function
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$mainTitle',style: TextStyle(color:AppStyle.blackColor,fontSize: 30 ),),
          Row(
            children: [
              Text("$subTitle1",style: TextStyle(color: AppStyle.greyColor,fontSize:14),),
              TextButton(child: Text(" $subTitle2 ",style: TextStyle(color: AppStyle.primaryColor,fontSize:14),),onPressed:function ,)

            ],
          )
        ],
      ),
    );
  }

}
