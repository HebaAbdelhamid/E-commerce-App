import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';

class CustomAuthenticationHeader extends StatelessWidget {
  const CustomAuthenticationHeader({
    super.key, this.onArrowBack,
  });

  final VoidCallback? onArrowBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
              width: 60,
              height: 35,
              decoration: BoxDecoration(
                color: AppStyle.lightGrayColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppStyle.blackColor,
                ),
                onPressed: onArrowBack ?? () {
                      MagicRouter.pop();

                    },
              ),
            ),
      actions: [
            SvgPicture.asset("assets/images/Group 1000000927.svg")
      ],
    );

      //  Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Container(
      //       width: 60,
      //       height: 35,
      //       decoration: BoxDecoration(
      //         color: AppStyle.lightGrayColor,
      //         borderRadius: BorderRadius.circular(5),
      //       ),
      //       child: IconButton(
      //         icon: Icon(
      //           Icons.arrow_back,
      //           color: AppStyle.blackColor,
      //         ),
      //         onPressed: onArrowBack ?? () {
      //               MagicRouter.pop();
      //
      //             },
      //       ),
      //     ),
      //     SvgPicture.asset("assets/images/Group 1000000927.svg")
      //   ],
      // ),
    // );
  }

}
