part of 'onboard_bloc.dart';

abstract class OnBoardSate {
  const OnBoardSate();
}
class InitialState extends OnBoardSate {

}
class RouteToNextPage extends OnBoardSate {}

class RouteToLoginPage extends OnBoardSate {}