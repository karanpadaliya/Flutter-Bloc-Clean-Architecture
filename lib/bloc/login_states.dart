part of 'login_bloc.dart';

class LoginStates extends Equatable {
  const LoginStates({
    this.email = '',
    this.password = '',
    this.error = '',
    this.postApiStatus = PostApiStatus.intial,
  });

  final String email;
  final String password;
  final String error;
  final PostApiStatus postApiStatus;

  LoginStates copyWith({
    String? email,
    String? password,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      error: message ?? this.error,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, error, postApiStatus];
}
