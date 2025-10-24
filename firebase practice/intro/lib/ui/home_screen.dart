import 'package:firebase_connection/ui/notification_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    NotificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);

    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value){
      print('device token');
      print(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
