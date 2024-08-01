part of 'singup_bloc.dart';

@immutable
abstract class SingupState {}

 class SingupInitial extends SingupState {}
class RouteToLogIn extends SingupState {}
class ChangePassState extends SingupState {}
class ChangeRepeadPassState extends SingupState {}



