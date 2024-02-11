import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/shared/network/endpoints/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  // object of Cubit
  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.toString());
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    if (isPassword) {
      suffix = Icons.visibility_off_outlined;
      emit(LoginChangePasswordVisibilityState());
    } else {
      suffix = Icons.visibility_outlined;
      emit(LoginChangePasswordVisibilityState());
    }
  }
}
