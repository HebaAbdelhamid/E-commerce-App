import 'package:flutter/material.dart';

class CustomCategoryName extends StatelessWidget {
  CustomCategoryName({
    required this.color1,
    required this.color2,
    required this.text,
    required this.width

  });
  Color color1;
  Color color2;
  String text;
  double width;

  @override
  Widget build(BuildContext context) {
    return
      Container(

      width: width,
      height: 50,
      decoration: BoxDecoration(color: color1,borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
            style: TextStyle(
                color: color2,
                fontWeight: FontWeight.bold,fontSize: 15),),

        ],
      ),
    );
  }
}
