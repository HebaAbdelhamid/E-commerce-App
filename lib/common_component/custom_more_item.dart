import 'package:flutter/material.dart';
import 'package:yiki1/core/styles.dart';

class CustomMoreItem extends StatelessWidget {
  CustomMoreItem({
    required this.image,required this.text,required this.function
  });
  String image;
  String text;
  Function()function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11.0),
        child: Row(
          children: [
            Container(
                width: 44,
                height: 45,
                decoration: BoxDecoration(color:Colors.grey.withOpacity(.1),borderRadius: BorderRadius.circular(45) ),
                child:Image.asset(image,width: 20,height:21,)
            ),

            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(text,style: TextStyle(
                  fontSize: 15,color:AppStyle.lightBlackColor
              ),),
            ),
            Expanded(child: SizedBox()),
            Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(color:Colors.grey.withOpacity(.1),borderRadius: BorderRadius.circular(45) ),
                child:Center(
                  child: IconButton(
                    icon:Icon(Icons.arrow_forward,size: 16,),onPressed: (){},
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
