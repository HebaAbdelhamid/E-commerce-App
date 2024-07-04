import 'package:flutter/material.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_view.dart';
import 'dart:async';
import '../auth/login/view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          if(AppStorage.isLogged){
            return BottonNavigationBarPage();
          }else {
            return LoginPage();
          }
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png',
              width: MediaQuery.of(context).size.width * 0.4,
              fit: BoxFit.cover,
            ), // Add your logo here
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
