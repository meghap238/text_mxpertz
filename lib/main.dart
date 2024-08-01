import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project_mxpertz/bloc/login/login_bloc.dart';
import 'package:test_project_mxpertz/bloc/onboarding/onboard_bloc.dart';
import 'package:test_project_mxpertz/screens/splash_screen.dart';
import 'bloc/home_bloc/home_bloc.dart';
import 'bloc/otp_bloc/otp_bloc.dart';
import 'bloc/signup_bloc/singup_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAbfmXBg6KsncYi2oRzvFtoqg97jBJRhEE',
        appId: '1:997216458644:android:95e990d3852efeacfde181',
        messagingSenderId: '997216458644',
        projectId: 'mxpertztest-8fefd',
        storageBucket: 'mxpertztest-8fefd.appspot.com',
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LoginBloc(),),
              BlocProvider(create: (context) => OnboardBloc(),),
              BlocProvider(create: (context) => HomeBloc(),),
              BlocProvider(create: (context) => OtpBloc(),),
              BlocProvider(create: (context) => SingupBloc(),),
            ],
            child: const SplashScreen()),
      ),
    );
  }
}

