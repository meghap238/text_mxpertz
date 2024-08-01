part of 'onboard_bloc.dart';

abstract class OnBoardEvent {
  const OnBoardEvent();
}
class NavigateEvent extends OnBoardEvent {

}

class OnNextPressed extends OnBoardEvent {}

class RouteToIndex extends OnBoardEvent {
  int index;
  RouteToIndex({required this.index});
}