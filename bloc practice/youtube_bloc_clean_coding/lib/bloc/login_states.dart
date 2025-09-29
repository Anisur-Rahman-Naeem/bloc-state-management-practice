part of 'login_bloc.dart';

class LoginStates extends Equatable {

  final String email;
  final String password;

  const LoginStates({
    this.email = '',
    this.password = '',
  });

  LoginStates copywith({
    String? email,
    String? password,
}){
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, password];
}