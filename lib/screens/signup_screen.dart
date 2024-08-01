import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project_mxpertz/bloc/login/login_bloc.dart';
import 'package:test_project_mxpertz/bloc/signup_bloc/singup_bloc.dart';
import 'package:test_project_mxpertz/screens/login_screen.dart';
import 'package:test_project_mxpertz/widgets.dart';

import '../config/app_color.dart';
import '../config/app_string.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SingupBloc bloc = SingupBloc();

  bool isHideRepead = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<SingupBloc, SingupState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is RouteToLogIn) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
            // TODO: implement listener
          },
          builder: (context, state) {
            print('this is the $state');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30)
                  .copyWith(top: 130),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppString.createsc,
                    style: TextStyle(
                      color: AppColor.blackClr,
                      fontWeight: FontWeight.w700,
                      fontSize: 24.sp,
                      fontFamily: 'poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        color: AppColor.blackClr,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        fontFamily: 'poppins'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40.sp,
                  ),
                  WidgetsAll.inputTextFieldWithoutSuffix(
                      keyboardType: TextInputType.emailAddress,
                      data: 'Email',
                      imgUrl: 'assets/icons/Message.png'),
                  SizedBox(
                    height: 20.sp,
                  ),
                  WidgetsAll.inputTextField(
                      keyboardType: TextInputType.visiblePassword,
                      data: 'Special Characters ',
                      imgUrl: 'assets/icons/Lock.png',
                      suffixImg: 'assets/icons/Hide.png',
                      onTap: () {
                        bloc.add(PassHideEvent());
                      },
                      ishide: bloc.isHide),
                  SizedBox(
                    height: 20.sp,
                  ),
                  WidgetsAll.inputTextField(
                      keyboardType: TextInputType.visiblePassword,
                      data: 'Repeat Password',
                      imgUrl: 'assets/icons/Lock.png',
                      suffixImg: 'assets/icons/Hide.png',
                      onTap: () {
                        bloc.add((RepeadPassHideEvent()));
                      },
                      ishide: bloc.isHideRepead),
                  SizedBox(
                    height: 20.sp,
                  ),
                  WidgetsAll.inputTextFieldForMobile(),
                  SizedBox(
                    height: 70.sp,
                  ),
                  WidgetsAll.CustomButton(
                    titleName: 'Next',
                    onPressed: () {
                      bloc.add(NextBtnEvent());
                    },
                  ),
                  SizedBox(
                    height: 30.sp,
                  ),
                  Text(
                    'Or Continue With',
                    style: TextStyle(
                        color: AppColor.blackClr,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        fontFamily: 'poppins'),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 50.sp,
                  ),
                  WidgetsAll.sigupContainer()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
