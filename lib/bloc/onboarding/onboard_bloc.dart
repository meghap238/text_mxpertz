import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnBoardEvent,OnBoardSate>{
  PageController pageController = PageController();
  int currentIndex = 0;
  List<String> images = [
    'assets/image/pana.svg',
    'assets/image/secondImg.svg',
    'assets/image/new.svg',
  ];
  List<String> text = [
    'online payment',
    'online shopping',
    'home deliver service',
  ];

  OnboardBloc() :super(InitialState()){
    on<OnNextPressed>((event, emit) {
      emit(InitialState());
      if (currentIndex < images.length - 1) {
        pageController.animateToPage(
          currentIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        emit(RouteToNextPage());
      }
      else {
        emit(RouteToLoginPage());
      }
    });
    on<RouteToIndex>((event, emit){
      emit(InitialState());
      currentIndex = event.index;
      emit(RouteToNextPage());
    });
  }


}
