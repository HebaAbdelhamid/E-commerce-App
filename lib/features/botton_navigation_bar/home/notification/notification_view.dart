import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yiki1/common_component/authentication_header.dart';
import 'package:yiki1/common_component/custom_loading.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/core/styles.dart';
import 'package:yiki1/features/botton_navigation_bar/botton_navigation_bar_view.dart';
import 'package:yiki1/features/botton_navigation_bar/home/notification/components/customNotificatioItem.dart';

import 'notification_cubit.dart';
import 'notification_state.dart';

class NotificationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NotificationCubit()..fetchNotification(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
  builder: (context, state) {
    final cubit=BlocProvider.of<NotificationCubit>(context);
    return Scaffold(
          backgroundColor: Colors.white,
          body: state is LoadingState||cubit.notificationRespone==null?CustomLoading() :Padding(
            padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20),
            child: ListView(children: [
              CustomAuthenticationHeader(onArrowBack:  () => MagicRouter.navigateAndPopAll(BottonNavigationBarPage(currentIndex: 0,)) ,),
              SizedBox(height: 10),
               Text(
                "Notifications".tr(),
                style: TextStyle(
                    color: AppStyle.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 13,
              ),
               Text(
                " Follow your notifications".tr(),
                style: TextStyle(
                    color: Color(0XFFA2A2A3),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Divider(
                color: AppStyle.primaryColor,
                thickness: 2,
              ),
              SizedBox(
                height: 13,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomNotficationItem(index,cubit);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 7,
                      );
                    },
                    itemCount: cubit.notificationRespone!.data!.items!.length),
              )
            ]),
          ));
  },
),
    );
  }
}
