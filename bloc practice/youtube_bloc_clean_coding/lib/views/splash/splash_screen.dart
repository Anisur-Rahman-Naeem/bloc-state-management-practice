import 'package:flutter/material.dart';
import 'package:youtube_bloc_clean_coding/config/components/internet_exception_widget.dart';
import 'package:youtube_bloc_clean_coding/data/exceptions/app_exceptions.dart';
import 'package:youtube_bloc_clean_coding/services/splash/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices _splashServices = SplashServices();
  
  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splash Screen', style: TextStyle(fontSize: 50),)
        ),
      ),
    );
  }
}
