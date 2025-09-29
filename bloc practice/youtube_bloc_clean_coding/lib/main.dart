import 'package:flutter/material.dart';
import 'package:youtube_bloc_clean_coding/config/routes/route_name.dart';
import 'package:youtube_bloc_clean_coding/config/routes/routes.dart';
import 'package:youtube_bloc_clean_coding/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
