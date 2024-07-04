import 'package:flutter/material.dart';
import 'package:yiki1/core/styles.dart';
class CartItem extends StatelessWidget {
  CartItem({
    required this.image,
    required this.title,
    required this.price,
    required this.count,
  });

  String image;
  String title;
  String price;
  int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .72,
          height: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/$image",
                  width: MediaQuery.of(context).size.width * .24,
                  height: MediaQuery.of(context).size.width * .3,
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(
                  width: 5
                ),
                SizedBox(
                  height: 100,
                  width: 130,
                  child: ListTile(
                    title: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xff252525),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    subtitle: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: "Price:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff252525),
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: price,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: AppStyle.primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outlined,
                              color: AppStyle.redColor)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
