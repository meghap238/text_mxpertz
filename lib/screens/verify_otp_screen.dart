import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project_mxpertz/bloc/otp_bloc/otp_bloc.dart';
import 'package:test_project_mxpertz/config/app_string.dart';
import 'package:test_project_mxpertz/widgets.dart';

import '../config/app_color.dart';
import 'home_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  OtpBloc bloc = OtpBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteClr,
      body: BlocConsumer<OtpBloc, OtpState>(
        bloc: bloc,
        listener: (context, state) {
          if(state is RouteToHome){
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        builder: (context, state) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 80.sp,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(

                    width: 40.sp,
                    height: 40.sp,
                    decoration: const BoxDecoration(image: DecorationImage(
                        image: AssetImage('assets/icons/Group.png'))),),
                ),
                SizedBox(height: 30.sp,),
                Text(
                  AppString.opTitle,
                  style: TextStyle(
                    color: AppColor.blackClr,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp, fontFamily: 'poppins',),
                  textAlign: TextAlign.center,

                ),
                SizedBox(height: 15.sp,),
                Text(
                  AppString.discriptionOtp,
                  style: TextStyle(
                      color: AppColor.disOtpClr,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp, fontFamily: 'poppins'),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.sp,),
                Container(

                  height: 100.sp,

                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WidgetsAll.CustomTextOtp(focusNode: bloc.textnode1,
                        onChanged: (value) {
                          if (value.length >= 1) {
                            FocusScope.of(context).requestFocus(bloc.textnode2);
                          }
                          else {
                            FocusScope.of(context).requestFocus(bloc.textnode1);
                          }
                        },
                        onFieldSubmitted: (value) {
                          if (value.length > 1) {
                            FocusScope.of(context).requestFocus(bloc.textnode2);
                          }
                        },
                      ),
                      SizedBox(width: 20.sp,),
                      WidgetsAll.CustomTextOtp(focusNode: bloc.textnode2,
                        onChanged: (value) {
                          if (value.length >= 1) {
                            FocusScope.of(context).requestFocus(bloc.textnode3);
                          }
                          else if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(bloc.textnode1);
                          }
                        }, onFieldSubmitted: (value) {
                          if (value.length > 1) {
                            FocusScope.of(context).requestFocus(bloc.textnode3);
                          }
                          else if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(bloc.textnode1);
                          }
                        },
                      ),
                      SizedBox(width: 20.sp,),
                      WidgetsAll.CustomTextOtp(focusNode: bloc.textnode3,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).requestFocus(bloc.textnode4);
                          }
                          else if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(bloc.textnode2);
                          }
                        },
                        onFieldSubmitted: (value) {
                          if (value.length > 1) {
                            FocusScope.of(context).requestFocus(bloc.textnode4);
                          }
                          else if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(bloc.textnode2);
                          }
                        },
                      ),

                      SizedBox(width: 20.sp,),
                      WidgetsAll.CustomTextOtp(focusNode: bloc.textnode4,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).unfocus();
                          }
                          else if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(bloc.textnode3);
                          }
                        },
                        onFieldSubmitted: (value) {
                          if (value.length > 1) {
                            FocusScope.of(context).unfocus();
                          }
                          else if (value.isEmpty) {
                            FocusScope.of(context).requestFocus(bloc.textnode4);
                          }
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40.sp,),
                WidgetsAll.CustomButton(titleName: 'verify', onPressed: () {
bloc.add(VerifyOtp());
                },)
              ],),
          );
        },
      ),
    );
  }
}
