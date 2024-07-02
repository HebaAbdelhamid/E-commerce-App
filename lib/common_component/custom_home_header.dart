import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/home/notification/notification_view.dart';

class CustomHomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CircleAvatar(
        radius: 27,
        backgroundImage: AssetImage(
          "assets/images/Rectangle 1885.png",
        ),
      ),
      SvgPicture.asset("assets/images/Group 1000000927.svg"),
      Stack(alignment: AlignmentDirectional.topEnd, children: [
        Container(
            width: 44,
            height: 45,
            decoration: BoxDecoration(
                color: AppStyle.lightGrayColor,
                borderRadius: BorderRadius.circular(45)),
            child: IconButton(
              icon: Icon(Iconic.bell),
              onPressed: () {
                MagicRouter.navigateTo(NotificationPage());
              },
            )),
        CircleAvatar(
          backgroundColor: AppStyle.redColor,
          radius: 4,
        )
      ]),
    ]);
  }
}
