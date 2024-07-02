import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/core/styles.dart';

class CustomNotficationItem extends StatelessWidget {
  const CustomNotficationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4, right: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     blurRadius: 4,
          //     offset: Offset(0.2, 0.2),
          //     blurStyle: BlurStyle.outer,
          //   )
          // ],
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2)),
      child: ListTile(
        leading: IconButton(
          icon: Icon(
            Iconic.bell_straight,
            color: AppStyle.primaryColor,
          ),
          onPressed: () {},
        ),
        title: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          style: TextStyle(
            color: AppStyle.blackColor,
            fontSize: 13,
          ),
        ),
        subtitle: Text(
          "2 mins ago".tr(),
          style: TextStyle(
            color: AppStyle.greyColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
