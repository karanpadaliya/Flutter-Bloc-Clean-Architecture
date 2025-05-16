import 'package:bloc_clean_architecture_yt/bloc/login_bloc.dart';
import 'package:bloc_clean_architecture_yt/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final emailFocusNode;

  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => current.email != previous.email,
      builder: (context, state) {
        print('Build Email');
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailFocusNode,
          decoration: InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChanged(email: value));
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }
            if (!Validations.isValidEmail(value)) return 'Email is not valid!!';
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
