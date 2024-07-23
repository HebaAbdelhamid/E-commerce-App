import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:yiki1/core/router.dart';
import 'package:yiki1/features/botton_navigation_bar/home/notification/notification_view.dart';

class FirebaseMessage {
  final firebaseMessage=FirebaseMessaging.instance;
  Future initNotification()async{
    await firebaseMessage.requestPermission();
    final firebase_M=await firebaseMessage.getToken();
    print("$firebase_M");

    return firebase_M;
  }
  void handleMessage(RemoteMessage?message){
    if(message==null)return ;
    print("=========$message");
    // MagicRouter.navigateTo(NotificationPage(message));
  }
  Future initNotifications()async{
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
     print("_messaging onMessageOpenedApp: ${message}");
    });


  }
}