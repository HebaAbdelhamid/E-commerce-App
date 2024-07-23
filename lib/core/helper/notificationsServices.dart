import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:yiki1/core/styles.dart';

class Notificationsservices{
  final FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();
  Future<void> initNotification()async{
    AndroidInitializationSettings androidInitializationSettings=AndroidInitializationSettings("flutter_logo");
   var InitializationSettingIos= DarwinInitializationSettings(
     requestAlertPermission: true,
     requestBadgePermission: true,
     requestSoundPermission: true,
     onDidReceiveLocalNotification: (int?id,String ?title,String?body,String?payload)async{}
   );
   var initializationSetting=InitializationSettings(android: androidInitializationSettings,
   iOS: InitializationSettingIos);
await notificationsPlugin.initialize(initializationSetting,onDidReceiveNotificationResponse: (NotificationResponse notificationResponse)async{});


  }
  showNotificationDetails(){
    return NotificationDetails(android: AndroidNotificationDetails(
      color: AppStyle.primaryColor,
        priority: Priority.high,
        "channelId","cannelName",icon:"flutter_logo" ,
        importance: Importance.max),iOS: DarwinNotificationDetails());
  }
  Future showNotification(int?id,String ?title,String?body,String?payload)async{
    print("$id $title $body $payload");
    return notificationsPlugin.show(id!, title, body,await showNotificationDetails());
  }
}