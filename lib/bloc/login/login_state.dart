part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccessful extends LoginState {}
final class RouteToOtp extends LoginState {}
final class RouteToSignUp extends LoginState {}



final class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
