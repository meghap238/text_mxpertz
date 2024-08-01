import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late int selectedIndex = 0;

  String? displayName;
  String? email;
  String? photoURL;
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchData>((event, emit) async {
      emit(HomeInitial());
      User? user = firebaseAuth.currentUser;
      emit(LoadingData());
      try{

          if (user != null) {
            DocumentSnapshot userDoc = await firestore.collection('users').doc(user.uid).get();
            // setState(() {
            displayName = userDoc['displayName'];
            email = userDoc['email'];
            photoURL = userDoc['photoURL'];
            //});
          }

        emit(LoadedData());

      }catch(e){
        emit(ErrorState(e.toString()));
      }


    });
    on<TabChangeEvent>((event, emit) {
      emit(HomeInitial());
      selectedIndex = event.index;
      print(selectedIndex);
      emit(TabChange());

    });
  }
}
