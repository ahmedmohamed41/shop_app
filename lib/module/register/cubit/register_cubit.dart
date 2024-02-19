import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/model/shop_login_model.dart';
import 'package:shop_app/shared/network/endpoints/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  ShopRegisterModel? registerModel;

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: register,
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      registerModel = ShopRegisterModel.fromJson(value.data);

      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

IconData suffix = Icons.visibility_outlined;
  bool isPassword = false;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    if (isPassword) {
      suffix = Icons.visibility_off_outlined;
      emit(RegisterChangePasswordVisibilityState());
    } else {
      suffix = Icons.visibility_outlined;
      emit(RegisterChangePasswordVisibilityState());
    }
  }

  

}
