import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yiki1/core/styles.dart';

class CustomOrderCanceled extends StatelessWidget {
  const CustomOrderCanceled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration:BoxDecoration(color: Colors.grey.withOpacity(.2),borderRadius: BorderRadius.circular(5)) ,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Order no. : ".tr(),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text("#46679797",
                      style: TextStyle(color: AppStyle.blackColor, fontWeight: FontWeight.bold)),
                  SizedBox(width: MediaQuery.of(context).size.width*.27,),
                  Text("2500 EGP",
                      style: TextStyle(color: AppStyle.primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Order Status :  ".tr(),
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(" Canceled".tr(),
                      style: TextStyle(color: AppStyle.redColor, fontWeight: FontWeight.bold)),
                  SizedBox(width: MediaQuery.of(context).size.width*.27,),
                ],
              ),
              Text(
                "Sunday , 12 Nov 2023  ",
                style: TextStyle(
                    color: Colors.grey.withOpacity(.9), fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 23,),



            ],
          ),
        ),
      );
  }
}
