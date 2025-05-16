import 'package:bloc_clean_architecture_yt/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  final formkey;

  const LoginButtonWidget({super.key, required this.formkey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
        if (state.postApiStatus == PostApiStatus.success) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.error.toString())));
        }
        if (state.postApiStatus == PostApiStatus.loading) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Submitting....')));
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) => false,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                print('Login btn Pressed!!');
                if (state.password.length < 6) {
                  print('Password length is not less then of 6');
                }
                context.read<LoginBloc>().add(LoginApi());
              }
            },
            child: Text('Login'),
          );
        },
      ),
    );
  }
}
