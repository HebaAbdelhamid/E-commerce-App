import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/core/styles.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4,right: 0),
      decoration: BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(7)),
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width*.16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/images/Group 1000000927.svg"),
              // Container(width: 3,height: 108,color: AppStyle.primaryColor,)
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(r"5.00 $",style: TextStyle(color: AppStyle.primaryColor,fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,) ,Text("First 5",style: TextStyle(color: AppStyle.blackColor,fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,) ,  Text("Valid until May 2024",style: TextStyle(color: AppStyle.blackColor,fontSize: 13,),),

          ],
        ),
        trailing: IconButton(
          icon: Icon(Iconic.copy,color: AppStyle.primaryColor,),
          onPressed: (){},
        ),
      ),
    );
  }
}
