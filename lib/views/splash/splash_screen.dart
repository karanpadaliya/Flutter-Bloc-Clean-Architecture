import 'package:bloc_clean_architecture_yt/config/routes/routes_name.dart';
import 'package:bloc_clean_architecture_yt/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: () {
          /// OLD Method
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));

        //   New method
          Navigator.pushNamed(context, RoutesName.homeScreen);
        }, child: Text('Home')),
      ),
    );
  }
}
