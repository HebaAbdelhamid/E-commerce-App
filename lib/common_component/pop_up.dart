import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconic/iconic.dart';

class PopupCardDetails extends StatelessWidget {
  String text1;
  String text2;
  Color text1Color;
  Color text2Color;
  FontWeight? fontWeight;

  PopupCardDetails(
      {required this.text1,
      required this.text2,
      required this.text1Color,
      required this.text2Color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(
              "assets/images/Rectangle 1890.svg",
              width: 100,
              height: 100,
            ),
            Icon(
              Iconic.check_bold_straight,
              color: Colors.white,
              size: 45,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$text1 ",
          style: TextStyle(
            color: text1Color,
            fontSize: 13,

          ),
          textAlign: TextAlign.center,

          maxLines: 5,
          overflow: TextOverflow.visible,
        ),
        Text(
          "$text2",
          style: TextStyle(
              color: text2Color, fontSize: 14, fontWeight: fontWeight),
        ),
      ],
    );
  }
}

class PopupCardDetails3 extends StatelessWidget {
  String text1;
  String text2;
  Color text1Color;
  Color text2Color;
  FontWeight? fontWeight;

  PopupCardDetails3(
      {required this.text1,
      required this.text2,
      required this.text1Color,
      required this.text2Color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(
              "assets/images/Rectangle 1890.svg",
              width: 180,
              height: 130,
            ),
            Icon(
              Iconic.check_bold_straight,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "$text2",
          style: TextStyle(
              color: text2Color, fontSize: 16, fontWeight: fontWeight),
        ),
        Text(
          "$text1 ",
          style: TextStyle(
            color: text1Color,
            fontSize: 16,
          ),
          maxLines: 5,
          textAlign: TextAlign.center,
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}

class PopupCardDetails2 extends StatelessWidget {
  String text1;
  String text2;
  Color text1Color;
  Color text2Color;
  FontWeight? fontWeight;

  PopupCardDetails2(
      {required this.text1,
      required this.text2,
      required this.text1Color,
      required this.text2Color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SvgPicture.asset(
              "assets/images/Rectangle 1890.svg",
              width: 100,
              height: 100,
            ),
            Icon(
              Iconic.check_bold_straight,
              color: Colors.white,
              size: 45,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(

            children: [
              TextSpan(
                  text: '$text1',
                  style: TextStyle(
                    color: text1Color,
                    fontSize: 14,
                  )),
              TextSpan(
                  text: '$text2',
                  style: TextStyle(
                      color: text2Color, fontSize: 14, fontWeight: fontWeight)),
            ],
          ),
        ),
      ],
    );
  }
}
