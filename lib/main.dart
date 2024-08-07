import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/core/app_storage/app_storage.dart';
import 'package:yiki1/core/helper/firebase_message.dart';
import 'package:yiki1/core/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yiki1/features/auth/login/view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_cubit.dart';
import 'package:yiki1/features/botton_navigation_bar/home/home_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/contact_as/contact_as_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/more_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/my_order/my_order_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/order%20_details/order%20_details_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/return_orders/return_orders_view.dart';
import 'package:yiki1/features/botton_navigation_bar/more/shared_applicaton/shared_applicaton_view.dart';
import 'package:yiki1/features/google_map/add_new_address/add_new_address_cubit.dart';
import 'package:yiki1/features/splash/splash_screen.dart';
import 'package:yiki1/features/animation/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessage().initNotification();
  print("object");

  runApp(EasyLocalization(
    supportedLocales: [Locale('en', ''), Locale('ar', '')],
    path: 'assets/lang', // <-- change the path of the translation files
    fallbackLocale: Locale('en', ''),
    child: YIKI(),
  ));
}

class YIKI extends StatelessWidget {
  YIKI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YIKI',
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AddNewAddressCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => HomeCubit(),
          )
        ],
        child: SplashScreen(),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
