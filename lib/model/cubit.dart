// ignore_for_file: avoid_print, annotate_overrides, avoid_renaming_method_parameters, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadid/model/dioHelper.dart';
import 'package:shadid/model/loginModel.dart';
import 'package:shadid/model/states.dart';
import 'package:shadid/utils/constant.dart';



 
// class LoginCubit extends Cubit<LoginStates> {
//   LoginCubit() : super(LoginInitialState());

//   static LoginCubit get(context) => BlocProvider.of(context);

//   late UserData loginModel;

//   void userLogin({
//     required String email,
//     required String password,
//   }) {
//     emit(LoginLoadingState());
//     DioHelper.postData(
//       url: 'LOGIN',
//       data: {
//         'email': email,
//         'password': password,
//       },
//     ).then((value) {
//       loginModel = UserData.fromJson(value?.data);
//       print(loginModel.api_token);

//       emit(LoginSuccessState(loginModel));
//     }).catchError((error) {
//       print(error.toString());
//       emit(LoginErrorState(error.toString()));
//     });
//   }
// }

//
//

// Register User Cubit
class RegisterUserCubit extends Cubit<RegisterUserStates> {
  RegisterUserCubit() : super(RegisterUserInitialState());

  static RegisterUserCubit get(context) => BlocProvider.of(context);

  late UserData loginModel;

  void userRegister({
    required String phone,
  }) {
    emit(RegisterUserLoadingState());
    DioHelper.postData(
      url: USER,
      data: {
        'phone': phone,
      },
    ).then((value) {
      loginModel = UserData.fromJson(value?.data);
      print(value?.data);
      emit(RegisterUserSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterUserErrorState(error.toString()));
    });
  }

  void userLogin({
    required String phone,
  }) {
    emit(RegisterUserLoadingState());
    DioHelper.postData(
      url: USER,
      data: {
        'phone': phone,
      },
    ).then((value) {
      loginModel = UserData.fromJson(value?.data);
      print(value?.data);
      emit(RegisterUserSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterUserErrorState(error.toString()));
    });
  }
}

// Register Captain Cubit
class RegisterCaptainCubit extends Cubit<RegisterCaptainStates> {
  RegisterCaptainCubit() : super(RegisterCaptainInitialState());

  static RegisterCaptainCubit get(context) => BlocProvider.of(context);

  late CaptainData loginModel;

  void CaptainRegister({
    required String phone,
  }) {
    emit(RegisterCaptainLoadingState());
    DioHelper.postData(
      url: 'Captain',
      data: {
        'phone': phone,
      },
    ).then((value) {
      loginModel = CaptainData.fromJson(value?.data);
      print(value?.data);
      emit(RegisterCaptainSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterCaptainErrorState(error.toString()));
    });
  }

  void CaptainLogin({
    required String phone,
  }) {
    emit(RegisterCaptainLoadingState());
    DioHelper.postData(
      url: 'Captain',
      data: {
        'phone': phone,
      },
    ).then((value) {
      loginModel = CaptainData.fromJson(value?.data);
      print(value?.data);
      emit(RegisterCaptainSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterCaptainErrorState(error.toString()));
    });
  }
}
