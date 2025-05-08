import 'package:bloc_clean_architecture_yt/config/components/loading_widget.dart';
import 'package:bloc_clean_architecture_yt/config/components/round_button_widget.dart';
import 'package:bloc_clean_architecture_yt/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture_yt/data/exceptions/app_exceptions.dart';
import 'package:flutter/material.dart';

import '../../config/components/internet_exception_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          throw NoInternetException('');
        },
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InternetExceptionWidget(onPress: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
