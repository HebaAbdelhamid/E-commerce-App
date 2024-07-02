import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/styles.dart';

class CustomCategory extends StatelessWidget {
  CustomCategory(
      {super.key, required this.image, required this.text1, required this.text2});

  String image;
  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 46,
          backgroundColor: AppStyle.primaryColor,
          child: SvgPicture.asset(
            image,
            width: 48,
            height: 42,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Text(
            text1,
            style: TextStyle(
                color: AppStyle.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ),
        Text(
          text2,
          style: TextStyle(
              color: Color(0XFFA2A2A3),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ],
    );
  }
}
