part of 'home_bloc.dart';

@immutable
abstract class HomeState {
 const HomeState();
}

 class HomeInitial extends HomeState {}
 class LoadingData extends HomeState {}
 class LoadedData extends HomeState {}
class TabChange extends HomeState {
  // final int num;
  // const TabChange({required this.num});

}

class ErrorState extends HomeState {
  final String msg;
  const ErrorState(this.msg);
}

