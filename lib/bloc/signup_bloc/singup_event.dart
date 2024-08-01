part of 'singup_bloc.dart';

@immutable
abstract class SingupEvent {
  const SingupEvent();

}
class NextBtnEvent extends SingupEvent{
  const NextBtnEvent();

}
class PassHideEvent extends SingupEvent{

}
class RepeadPassHideEvent extends SingupEvent{

}