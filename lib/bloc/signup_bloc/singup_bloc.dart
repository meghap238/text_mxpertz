import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'singup_event.dart';
part 'singup_state.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  bool isHide = true;
  bool isHideRepead = true;
  SingupBloc() : super(SingupInitial()) {
    on<SingupEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NextBtnEvent>((event, emit) {
      emit(SingupInitial());
      emit(RouteToLogIn());

    },);
    on<PassHideEvent>((event, emit) {
      emit(SingupInitial());
      isHide = !isHide;
      emit(ChangePassState());
    },);
    on<RepeadPassHideEvent>((event, emit) {
      emit(SingupInitial());
      isHideRepead = !isHideRepead;
      emit(ChangeRepeadPassState());
    },);


  }
}
