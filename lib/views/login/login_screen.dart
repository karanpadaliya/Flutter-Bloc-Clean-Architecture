import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/login_bloc.dart';
import 'widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBlocs;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _loginBlocs = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider(
        create: (_) => _loginBlocs,
        child: Padding(
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
      ),
    );
  }
}
