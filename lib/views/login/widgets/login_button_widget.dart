import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final formkey;

  const LoginButtonWidget({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formkey.currentState!.validate()) {}
      },
      child: Text('Login'),
    );
  }
}
