import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:test_project_mxpertz/bloc/login/login_bloc.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {

  final textnode1 = FocusNode();
  final textnode2 = FocusNode();
  final textnode3 = FocusNode();
  final textnode4 = FocusNode();
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<VerifyOtp>((event, emit) {
      emit(RouteToHome());
    });
  }
}
