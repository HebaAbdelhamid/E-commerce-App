import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

class SubPageHeader extends StatelessWidget {

   SubPageHeader({
     super.key
  });
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 35,
            decoration: BoxDecoration(
              color: AppStyle.lightGrayColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppStyle.blackColor,
              ),
              onPressed: (){
                MagicRouter.pop();
              }
            ),
          ),

          Stack(
              alignment: AlignmentDirectional.topEnd,
              children:[
                Container(
                    width: 44,
                    height: 45,
                    decoration: BoxDecoration(color:AppStyle.lightGrayColor,borderRadius: BorderRadius.circular(45) ),
                    child:IconButton(
                      icon:Icon(Iconic.shopping_cart ),onPressed: (){},
                    )
                ),
                CircleAvatar(backgroundColor: AppStyle.redColor,radius: 4,)
              ]
          ) ,



        ]
    );
  }
}
