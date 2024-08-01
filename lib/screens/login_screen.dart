
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project_mxpertz/config/app_string.dart';
import 'package:test_project_mxpertz/screens/signup_screen.dart';
import 'package:test_project_mxpertz/screens/verify_otp_screen.dart';

import '../bloc/login/login_bloc.dart';
import '../config/app_color.dart';
import '../widgets.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: bloc,
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginError) {
            print('Error during Google Sign In: ${state.error}');
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Sign In Error'),
                content: const Text(
                    'An error occurred during Google Sign In. Please try again.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
          if (state is LoginSuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Successfully saved')));

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (state is RouteToSignUp) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          } else if (state is RouteToOtp) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => VerifyOtpScreen()));
          }
        },
        builder: (context, state) {
          return bloc.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp)
                        .copyWith(top: 50.sp, bottom: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Image(image: AssetImage('assets/image/logo.png')),
                         SizedBox(
                          height: 30.sp,
                        ),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                              color: AppColor.blackClr,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,fontFamily: 'poppins'),
                          textAlign: TextAlign.center,
                        ),
                         SizedBox(
                          height: 20.sp,
                        ),
                        Text(
                          'Login to continue',
                          style: TextStyle(
                              color: AppColor.blackClr,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp,fontFamily: 'poppins'),
                          textAlign: TextAlign.center,
                        ),
                         SizedBox(
                          height: 30.sp,
                        ),
                        WidgetsAll.inputTextFieldWithoutSuffix(data: 'Phone Number',keyboardType: TextInputType.number,imgUrl:'assets/icons/mobileIcon.png' ),
                        const SizedBox(
                          height: 20,
                        ),
                        WidgetsAll.CustomButton(titleName: 'Get OTP', onPressed: () {
                          bloc.add(GetOTP());
                        },),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          AppString.continu,
                          style: TextStyle(
                              color: AppColor.blackClr,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,fontFamily: 'poppins'),
                          textAlign: TextAlign.center,
                        ),
                         SizedBox(
                          height: 50.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            WidgetsAll.ContainerLginsc(imgUrl: 'assets/image/Google@2x.png', title: AppString.google,onTap:() => bloc.add(GoogleSignInEvent())),
                            SizedBox(
                              width: 20,
                            ),
                            WidgetsAll.ContainerLginsc(imgUrl: 'assets/image/Facebook@2x.png', title: AppString.facebook,),

                          ],
                        ),
                         SizedBox(
                          height: 80.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text('Don’t have an account?',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    fontFamily: 'poppins')),
                            GestureDetector(
                              child: Text(
                                ' SIGN UP',
                                style: TextStyle(
                                    color: AppColor.scBackgroundClr,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                    fontFamily: 'poppins',
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColor.scBackgroundClr),
                              ),
                              onTap: () => bloc.add((SingUp())),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
