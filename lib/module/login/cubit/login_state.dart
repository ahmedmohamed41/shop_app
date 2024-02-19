part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitialState extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final ShopLoginModel model;

  LoginSuccessState(this.model);
}

final class LoginErrorState extends LoginState {}

final class LoginChangePasswordVisibilityState extends LoginState {}



