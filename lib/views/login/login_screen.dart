import 'package:flutter/material.dart';
import 'widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EmailInputWidget(emailFocusNode: emailFocusNode),
              SizedBox(height: 20),
              PasswordInputWidget(passwordFocusNode: passwordFocusNode),
              SizedBox(height: 20),
              LoginButtonWidget(formkey: _formkey),
            ],
          ),
        ),
      ),
    );
  }
}
