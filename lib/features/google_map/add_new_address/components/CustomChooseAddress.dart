import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomChooseAddress extends StatelessWidget {
  CustomChooseAddress({
    super.key,
    required this.image,
    required this.text,
    required this.color1,
    required this.color2
  });
  String image;
  String text;
  Color color1;
  Color color2;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height:40 ,
      decoration: BoxDecoration(color: color1,borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 7,),
          SvgPicture.asset(
            "assets/images/$image",color: color2,
            fit: BoxFit.cover,width: 22,
          ),SizedBox(width: 7,),
          Text(
            text,
            style: TextStyle(color: color2, fontSize: 15),
          ),


        ],
      ),
    );
  }
}
