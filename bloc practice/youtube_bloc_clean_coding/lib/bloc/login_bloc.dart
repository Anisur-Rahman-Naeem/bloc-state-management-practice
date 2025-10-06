import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:youtube_bloc_clean_coding/repository/auth/login_repository.dart';
import 'package:youtube_bloc_clean_coding/utils/enums.dart';
import 'package:youtube_bloc_clean_coding/views/login/widgets/login_button.dart';

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
    emit(state.copywith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    print(event.password);
    emit(state.copywith(password: event.password));
  }
  Future<void> _loginApi(LoginApi event, Emitter<LoginStates> emit) async {
    Map data = {"email" : state.email, "password": state.password};
    await loginRepository.loginApi(data).then((value){
      if(value.message.isNotEmpty){
        print('successful');
        emit(
          state.copywith(postApiStatus: PostApiStatus.loading)
        );
      }else{
        emit(
          state.copywith(message: value.message.toString(),postApiStatus: PostApiStatus.error)
        );
      }
    }).onError((error, stackTrace){
      emit(
        state.copywith(message: error.toString(), postApiStatus: PostApiStatus.error),
      );
    });
    emit(state.copywith());
  }
}