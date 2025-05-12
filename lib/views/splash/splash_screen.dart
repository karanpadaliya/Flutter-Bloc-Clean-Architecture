import 'package:bloc_clean_architecture_yt/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_architecture_yt/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

import '../../config/components/internet_exception_widget.dart';

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
          child: Text('Splash scrren', style: TextStyle(fontSize: 50)),
        ),
      ),
    );
  }
}
