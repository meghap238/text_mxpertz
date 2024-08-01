import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project_mxpertz/bloc/onboarding/onboard_bloc.dart';
import 'package:test_project_mxpertz/config/app_string.dart';
import 'package:test_project_mxpertz/widgets.dart';
import '../config/app_color.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  OnboardBloc bloc = OnboardBloc();

  @override
  void dispose() {
    bloc.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scBackgroundClr,
      body: BlocConsumer<OnboardBloc, OnBoardSate>(
        bloc: bloc,
        listener: (context, state) {
          if (state is RouteToLoginPage) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        },
        builder: (context, state) {
          return PageView.builder(
            controller: bloc.pageController,
            itemCount: bloc.images.length,
            onPageChanged: (index) => bloc.add(RouteToIndex(index: index)),
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: AppColor.scBackgroundClr,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: WidgetsAll.CustomContainer(
                            title: bloc.text[index],
                            discription: AppString.discription,
                            width: MediaQuery.of(context).size.width)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 300.sp),
                      child:
                          Center(child: SvgPicture.asset(bloc.images[index])),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.sp, bottom: 30.sp),
                      child: GestureDetector(
                        onTap: () => bloc.add(OnNextPressed()),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset('assets/image/next-arrow.png')),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
