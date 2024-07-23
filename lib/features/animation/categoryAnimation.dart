import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryAnimation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SizedBox(
              width: 200,
              child: Lottie.asset('assets/Animation - 1721727122967.json')),
        )

    );
  }

}