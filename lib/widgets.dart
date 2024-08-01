import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../config/app_color.dart';

abstract class WidgetsAll{
  static Widget CustomButton({required String titleName, required void Function()? onPressed}){
   return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                AppColor.scBackgroundClr),
            padding:  MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 15.sp))),
        onPressed: onPressed,
        child: Text(titleName,
            style: TextStyle(
                color: AppColor.whiteClr,
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,fontFamily: 'poppins')));
  }

  static Widget CustomContainer({double? width, required String title,required String discription,}){
    return  Container(
      height: 320,
      width: width,
      decoration: BoxDecoration(
          color: AppColor.whiteClr,
          borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          SizedBox(height: 50,),
          Text(title, style:
          TextStyle(color: AppColor.titleClr,fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(height: 50,),
          Text(discription, style:
          TextStyle(color: AppColor.discriptionClr,fontWeight: FontWeight.w500, fontSize: 12),textAlign: TextAlign.center,
          ),
          SizedBox(height: 60,),
          GradientText(
            'Skip>>',
            colors: const [Color(0xffFF7D00),Color(0xffFFB400)],
            style: TextStyle(color: AppColor.discriptionClr,fontWeight: FontWeight.w700, fontSize: 16,),),
          SizedBox(height: 30,),
        ],),
      ),
    );
  }

  static Widget CustomTextOtp({
  FocusNode? focusNode,void Function(String)? onChanged,void Function(String)? onFieldSubmitted}){
   return Flexible(
     child: Container(
       height: 70.sp,
       alignment: Alignment.center,
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(13.sp),
           color: Colors.white,
           boxShadow: [
             BoxShadow(color: Colors.grey.shade300,blurRadius: 4.sp)
           ]),
       child: TextFormField(
         autofocus: true,
           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
           textAlign: TextAlign.center,
           keyboardType: TextInputType.number,

           decoration: const InputDecoration
             (border: InputBorder.none,
             fillColor: Colors.white,
             contentPadding: EdgeInsets.only(bottom: 10),
           ),
         focusNode: focusNode,
         onChanged:onChanged,
         //     (value) {
         //   if(value.length >= 1){
         //     FocusScope.of(context).requestFocus(textnode2);
         //   }
         //   else{
         //     FocusScope.of(context).requestFocus(textnode1);
         //   }
         //
         // },
         onFieldSubmitted: onFieldSubmitted
         //     (value) {
         //   if(value.length > 1){
         //     FocusScope.of(context).requestFocus(textnode2);
         //   }
         // },
       ),
     ),
   );
  }
static Widget inputTextField({String? data, TextInputType? keyboardType, String? imgUrl,String? suffixImg, void Function()? onTap,bool ishide = true })
{
  return  Container(
    decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey.shade100,),borderRadius: BorderRadius.circular(15.sp)),
    alignment: Alignment.center,
    height: 50.sp,
    child: TextFormField(
    keyboardType: keyboardType,
obscureText: ishide,
    decoration:  InputDecoration(
    prefixIcon:
       Container(
         child:  Image.asset(imgUrl ?? 'assets/icons/mobileIcon.png') ,
      ),

    suffixIcon: GestureDetector(
      onTap: onTap,
      child: Container(
          height: 15,width: 15,
          child: Image.asset(suffixImg ?? 'assets/icons/mobileIcon.png')
      ),
    ),
    hintText: data,
    hintStyle: TextStyle(
    fontWeight: FontWeight.w400, fontSize: 14.sp,fontFamily: 'poppins',color: Colors.grey.shade400),border: InputBorder.none
     ),
    ),
  );
}

  static Widget inputTextFieldWithoutSuffix({String? data, TextInputType? keyboardType, String? imgUrl, })
  {
    return  Container(
      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey.shade100,),borderRadius: BorderRadius.circular(15.sp)),
      alignment: Alignment.center,
      height: 50.sp,
      child: TextFormField(
        keyboardType: keyboardType,
        decoration:  InputDecoration(
            prefixIcon: Container(
              child:  Image.asset(imgUrl ?? 'assets/icons/mobileIcon.png'),
                ),
            hintText: data,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14.sp,fontFamily: 'poppins',color: Colors.grey.shade400),border: InputBorder.none
        ),
      ),
    );
  }

  static Widget inputTextFieldForMobile()
  {
    return  Container(
      decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey.shade100,),borderRadius: BorderRadius.circular(15.sp)),
      alignment: Alignment.center,
      height: 50.sp,
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15.sp),
                  height: 20.sp,width: 20.sp,
                    child: Image.asset('assets/icons/Flag@2x.png')),
                SizedBox(width: 10.sp,),
                Container(
                    margin: EdgeInsets.only(left: 15.sp),
                    height: 30.sp,width: 50.sp,
                    child: Image.asset('assets/icons/nearflag.png')),
                SizedBox(width: 10.sp,),
              ],
            ),
            hintText: 'Mobile Number',
            hintStyle: TextStyle(
                fontWeight: FontWeight.w400, fontSize: 14.sp,fontFamily: 'poppins',color: Colors.grey.shade400),border: InputBorder.none
        ),
      ),
    );
  }


static Widget sigupContainer(){
    return   Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(
                      'assets/image/apple.png')),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Google',
                style: TextStyle(
                    color: AppColor.blackClr,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,fontFamily: 'poppins'),
                textAlign: TextAlign.center,
              ),
            ],
          ),       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(
                      'assets/image/google.png')),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Google',
                style: TextStyle(
                    color: AppColor.blackClr,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,fontFamily: 'poppins'),
                textAlign: TextAlign.center,
              ),
            ],
          ),       Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                  image: AssetImage(
                      'assets/image/facebooksmall.png')),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                'Facebook',
                style: TextStyle(
                    color: AppColor.blackClr,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,fontFamily: 'poppins'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],),
    );
}
static Widget ContainerLginsc({void Function()? onTap,required String imgUrl,required String title}){
    return  InkWell(
      onTap: onTap,
      child: Container(
        height: 100.sp,
        width: 140.sp,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 4.sp,
              )
            ],
            color: Color(0xffF4F4F4),
            borderRadius:
            BorderRadius.all(Radius.circular(30.sp)),
            border: Border.all(
                width: 1.5,
                color: Colors.grey.shade200)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image(
                image: AssetImage(imgUrl)),
            SizedBox(
              height: 10.sp,
            ),
            Text(
             title,
              style: TextStyle(
                  color: AppColor.blackClr,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,fontFamily: 'poppins'),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),

    );
}

}