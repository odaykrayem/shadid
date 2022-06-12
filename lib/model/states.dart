 
import 'package:shadid/model/loginModel.dart';

// abstract class LoginStates {}

// class LoginInitialState extends LoginStates {}

// class LoginLoadingState extends LoginStates {}

// class LoginSuccessState extends LoginStates {
//   late final UserData loginModel;

//   LoginSuccessState(this.loginModel);
// }

// class LoginErrorState extends LoginStates {
//   final String error;

//   LoginErrorState(this.error);
// }

// Register States

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  late final UserData loginModel;

  RegisterSuccessState(this.loginModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}
