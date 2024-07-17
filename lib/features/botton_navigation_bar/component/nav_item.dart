import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yiki1/public/styles.dart';

class NavItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  NavItem(
      {super.key,
      required this.isActive,
      required this.title,
      this.badgeContent, required this.icon});

  final bool isActive;
  final String title;
  final String? badgeContent;
 final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.white : Styles.colorPrimary,
        ),
        isActive
            ? const SizedBox()
            : Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
      ],
    );
  }
}
