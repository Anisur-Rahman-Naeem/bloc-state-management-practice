part of 'login_bloc.dart';

class LoginStates extends Equatable {

  final String email;
  final String password;
  final String message;
  final PostApiStatus postApiStatus;

  const LoginStates({
    this.message = '',
    this.postApiStatus = PostApiStatus.initial,
    this.email = '',
    this.password = '',
  });

  LoginStates copywith({
    String? message,
    String? email,
    String? password,
    PostApiStatus? postApiStatus
}){
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, message];
}