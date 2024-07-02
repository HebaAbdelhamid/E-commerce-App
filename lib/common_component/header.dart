import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeHeader extends StatelessWidget {
  const CustomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(child: Image.asset('assets/images/Logo.png',fit: BoxFit.contain,width: 148,height: 70,)),
    );
  }
}
