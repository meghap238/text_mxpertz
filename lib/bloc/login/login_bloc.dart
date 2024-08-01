import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GoogleSignInEvent>((event, state) async {
      emit(LoginInitial());
      isLoading = true;
      emit(LoginLoading());
      final GoogleSignIn googleSignIn = GoogleSignIn();
      try {
        // Sign out from any existing Google sessions
        await googleSignIn.signOut();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        if (googleUser != null) {
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);

          // Store user details in Firestore
          User? user = userCredential.user;
          if (user != null) {
            await firestore.collection('users').doc(user.uid).set({
              'uid': user.uid,
              'displayName': user.displayName,
              'email': user.email,
              'photoURL': user.photoURL,
            });
          }

          emit(LoginSuccessful());
        }
      }catch (e){
        emit(LoginError(error: e.toString()));
      }finally {
        isLoading = false;
        emit(LoginInitial());
      }
    });
    on<GetOTP>((event, state){
     emit(RouteToOtp());
    });
    on<SingUp>((event, state){
      emit(RouteToSignUp());
    });
  }

}
