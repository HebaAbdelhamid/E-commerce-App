import 'package:flutter/cupertino.dart';

class CartDetails extends StatelessWidget {
  CartDetails({
    super.key,
    required this.titleColor,
    required this.priceColor,
    required this.title,
    required this.price
  });
  Color titleColor;
  Color priceColor;
  String title;
  String price;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(color: titleColor,fontWeight: FontWeight.bold,fontSize: 15),),
        Text(price,style: TextStyle(color:priceColor,fontWeight: FontWeight.bold)),

      ],
    );
  }
}
