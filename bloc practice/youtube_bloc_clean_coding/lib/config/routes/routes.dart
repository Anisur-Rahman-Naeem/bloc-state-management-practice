import 'package:flutter/material.dart';
import 'package:youtube_bloc_clean_coding/config/routes/route_name.dart';
import 'package:youtube_bloc_clean_coding/views/view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
        case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
        case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context){
          return Scaffold(
            body: Center(
              child: Text('No route generated'),
            ),
          );
        });
    }
  }
}