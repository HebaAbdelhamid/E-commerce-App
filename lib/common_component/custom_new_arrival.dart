import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNewArrival extends StatelessWidget {
  CustomNewArrival({
    required this.color1,
    required this.color2,
    required this.image,
    required this.text,
    required this.width

  });
  Color color1;
  Color color2;
  String image;
  String text;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: width,
      height: 50,
      decoration: BoxDecoration(color: color1,borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(image,color: color2,),
          Text(text,
            style: TextStyle(
                color: color2,
                fontWeight: FontWeight.bold,fontSize: 15),),

        ],
      ),
    );
  }
}
