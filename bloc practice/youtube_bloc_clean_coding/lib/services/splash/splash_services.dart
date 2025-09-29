

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:youtube_bloc_clean_coding/config/routes/route_name.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    Timer(Duration(seconds: 3), () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false));
  }
}