part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchData extends HomeEvent{}
class TabChangeEvent extends HomeEvent{
  final int index;
  TabChangeEvent({required this.index});
}


