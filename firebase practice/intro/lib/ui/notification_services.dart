import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices{

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> requestNotificationPermission()async{
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    // if(NotificationSettings.authorizationStatus == AuthorizationStatus.authorized){
    //   print('user permission granted!');
    // }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
    //   print('user granted provisional permission!');
    // }else{
    //   AppSettings.openAppSettings(type: AppSettingsType.notification);
    //   print('user denied permission');
    // }

    // background
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessage);

    //foreground
    FirebaseMessaging.onMessage.listen(_onMessage);

    //terminated
    // FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  static void _onMessage(RemoteMessage message){
    print(message.data);
    print(message.notification?.title);
    print(message.notification?.body);
  }

  Future<String> getDeviceToken() async{
    String? token = await messaging.getToken();
    return token!;
  }

  void isTokenRefresh()async{
    messaging.onTokenRefresh.listen((event){
      event.toString();
      print('refresh');
    });
  }

  Future<void> _onBackgroundMessage(RemoteMessage message) async{
    print('got a new message');
  }


}