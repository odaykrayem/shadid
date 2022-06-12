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

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  late UserData loginModel;

  void userRegister({
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: USER,
      data: {
        'phone': phone,
      },
    ).then((value) {
      loginModel = UserData.fromJson(value?.data);
      print(value?.data);
      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}

//
//

// class ProfileCubit extends Cubit<ProfileStates> {
//   ProfileCubit() : super(ProfileInitialState());

//   static ProfileCubit get(context) => BlocProvider.of(context);

//   void editProfile(
//     String token,
//     String name,
//     String gender,
//     String phone,
//     // String email,
//     // String password,
//   ) {
//     emit(ProfileLoadingState());
//     DioHelper.postData(
//       url: 'PROFILE',
//       data: {
//         'name': name,
//         'token': token,
//         'gender': gender,
//         'phone': phone,
//         // 'email': email,
//         // 'password': password,
//       },
//     ).then((value) {
//       print(value?.data);
//       emit(ProfileSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(ProfileErrorState(error.toString()));
//     });
//   }
// }
