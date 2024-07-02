import 'package:flutter/material.dart';
import 'package:yiki1/core/styles.dart';

class PriceCount extends StatelessWidget {
  PriceCount({
    required this.title,
    required this.color,
    required this.width
  });
  final String title;
  Color color;
  double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Container(
        width: width,
        height: 33,
        color:color,
        child: Center(child: Text(title,style: TextStyle(fontSize: 17,color: AppStyle.primaryColor,fontWeight: FontWeight.bold))),
      ),
    );
  }
}
