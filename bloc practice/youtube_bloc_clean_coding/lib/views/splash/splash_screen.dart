import 'package:flutter/material.dart';
import 'package:youtube_bloc_clean_coding/config/components/internet_exception_widget.dart';
import 'package:youtube_bloc_clean_coding/data/exceptions/app_exceptions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            throw NoInternetException('');
          }),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InternetExceptionWidget(onPress: () {  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
