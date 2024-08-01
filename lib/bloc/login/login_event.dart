part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class GoogleSignInEvent extends LoginEvent {

}

class GetOTP extends LoginEvent {}

class SingUp extends LoginEvent {}
