import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture_yt/utils/enums.dart';
import 'package:bloc_clean_architecture_yt/views/login/widgets/login_button_widget.dart';
import 'package:equatable/equatable.dart';

import '../repository/auth/login_repository.dart';

part 'login_event.dart';

part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginRepository loginRepository = LoginRepository();

  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    print(event);

    Map data = {"email": state.email, "password": state.password};
    // Map data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));

    await loginRepository
        .loginApi(data)
        .then((value) {
          if (value.error.isNotEmpty) {
            print('Successfull!!');
            emit(
              state.copyWith(
                message: value.error.toString(),
                postApiStatus: PostApiStatus.error,
              ),
            );
          } else {
            emit(
              state.copyWith(
                message: value.token,
                postApiStatus: PostApiStatus.success,
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              message: error.toString(),
              postApiStatus: PostApiStatus.error,
            ),
          );
        });
  }
}
