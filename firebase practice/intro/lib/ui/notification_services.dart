import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_connection/ui/message_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

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

  void initLocalNotifications(BuildContext context, RemoteMessage message)async{
    var androidInitialization = AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitialization = DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitialization,
        iOS: iosInitialization
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSetting,
    onDidReceiveNotificationResponse: (payload){
      handleMessage(context, message);
    });
  }

  void firebaseInit(BuildContext context){


    FirebaseMessaging.onMessage.listen((message){
      if (kDebugMode){
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }

      if(Platform.isAndroid){
        initLocalNotifications(context, message);
        showNotification(message);
      }else{
        showNotification(message);
      }
    });
  }

  Future<void> showNotification(RemoteMessage message) async{

    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(100000).toString(),
        'High Importance Notification',
      importance: Importance.max
    );
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channelDescription: 'your channel description' ,
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher'
    );

    DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings(
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      // iOS: darwinInitializationSettings
    );

    Future.delayed(Duration.zero, (){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });

    // Future.delayed(Duration.zero,
    //   _flutterLocalNotificationsPlugin.show(
    //       0,
    //       message.notification!.title.toString(),
    //       message.notification!.body.toString(),
    //       notificationDetails);
    // );
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

  Future<void> setupInteractMessage(BuildContext context) async{

    //when app is terminated
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null){
      handleMessage(context, initialMessage);
    }

    //when app is inbackground
    FirebaseMessaging.onMessageOpenedApp.listen((event){
      handleMessage(context, event);
    });
  }

  Future<void> _onBackgroundMessage(RemoteMessage message) async{
    print('got a new message');
  }

  void handleMessage(BuildContext context, RemoteMessage message){
    if(message.data['type'] == 'msj'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(id: message.data['id'],)));
    }
  }
}