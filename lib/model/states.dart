import 'package:shadid/model/loginModel.dart';

// Registr User States
abstract class RegisterUserStates {}

class RegisterUserInitialState extends RegisterUserStates {}

class RegisterUserLoadingState extends RegisterUserStates {}

class RegisterUserSuccessState extends RegisterUserStates {
  late final UserData userData;

  RegisterUserSuccessState(this.userData);
}

class RegisterUserErrorState extends RegisterUserStates {
  final String error;

  RegisterUserErrorState(this.error);
}

// Registr Captain States

abstract class RegisterCaptainStates {}

class RegisterCaptainInitialState extends RegisterCaptainStates {}

class RegisterCaptainLoadingState extends RegisterCaptainStates {}

class RegisterCaptainSuccessState extends RegisterCaptainStates {
  late final CaptainData captainData;

  RegisterCaptainSuccessState(this.captainData);
}

class RegisterCaptainErrorState extends RegisterCaptainStates {
  final String error;

  RegisterCaptainErrorState(this.error);
}
