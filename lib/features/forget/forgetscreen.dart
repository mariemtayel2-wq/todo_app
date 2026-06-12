import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:evently_app/core/resources/imagemanger/image_manger.dart';
import 'package:evently_app/core/route_manger/routemanger.dart';
import 'package:evently_app/core/widget/custum%20elevated%20buuton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  TextEditingController emailcontroller=TextEditingController();
  @override

  Widget build(BuildContext context) {
    return
      SafeArea(child:
      Scaffold(
        backgroundColor:AppColorLight.background,
        body: Padding(
          padding:EdgeInsetsGeometry.symmetric(vertical: 60.h,horizontal: 20.w),
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    alignment: AlignmentGeometry.center,
                  margin: EdgeInsets.only(right: 80.w),
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(8),
                      color: AppColorLight.white
                    ),
                    child: IconButton(onPressed: (){
                      Navigator.pushReplacementNamed(context, Routemanger.loginRoute);
                    },
                        icon: Icon(Icons.arrow_back_ios_new,size: 20,color: AppColorLight.mainColor,)),
                  ),
                  Text("forget password".tr(),style:TextStyle(
                    fontWeight: FontWeight(600),
                    fontSize: 18.sp,
                    color: AppColorLight.mainText,
                  ), ),
                ],
              ),
              Image.asset(ImageManager.forget, fit: BoxFit.contain,),

              Custumelevatedbutton(

                  onPressed:(){
                    ///verifay account
                  },
                  backgroundcolor: AppColorLight.mainColor,

                  child:Text( "reset-password".tr(),
                    style:  TextStyle(
                      color: AppColorLight.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight(600),
                    )
                    ,)),

            ],
          ),
        ),
      ));
  }

}