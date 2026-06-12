import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/resources/color_manager/color_manger.dart';
import 'package:evently_app/core/resources/imagemanger/image_manger.dart';
import 'package:evently_app/core/widget/custum%20elevated%20buuton.dart';
import 'package:evently_app/core/widget/custum-textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/route_manger/routemanger.dart';

class Login extends StatefulWidget {
 const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  late final formkey = GlobalKey<FormState>();

  bool ontab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 70.h, horizontal: 16.w),
        child: Form(
          key: formkey,
          child: Column(
            spacing:20.h,
            children: [
              Image.asset(ImageManager.splash_logo, width: 0.5.sw, fit: BoxFit.contain),

              Text(
                "login_to_account".tr(),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight(600),
                  color: AppColorLight.mainColor, // هيتغير
                ),
              ),
              CustumTextFormFieled(
                borderside: AppColorLight.secondaryText,
                // هيتغير
                prefixicon: Icon(
                  Icons.email_outlined,
                  color: AppColorLight.disable,
                  size: 24.sp,
                ),
                hintstyle: TextStyle(
                  fontWeight: FontWeight(400),
                  fontSize: 14.sp,
                  color: AppColorLight.secondaryText,
                ),
                hinttext: "enter_email".tr(),
                fillcolor: AppColorLight.white,
                filled: true,
                maxline: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
                controller: emailcontroller,
              ),
              CustumTextFormFieled(
                borderside: AppColorLight.secondaryText,
                obscureText: ontab,
                hinttext: "password".tr(),

                hintstyle: TextStyle(
                  fontWeight: FontWeight(400),
                  fontSize: 14.sp,
                  color: AppColorLight.secondaryText,
                ),
                maxline: 1,
                prefixicon: Icon(
                  Icons.password_outlined,
                  size: 24.sp,
                  color: AppColorLight.secondaryText,
                ),
                fillcolor: AppColorLight.white,
                filled: true,
                suffixicon: IconButton(
                  onPressed: () {
                    ontab ? ontab = false : ontab = true;
                    setState(() {});
                  },
                  icon: ontab
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                ),

                controller: passwordcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required".tr();
                  }

                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // forget screen
                    },
                    child: Text(
                      "forgot_password".tr(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight(600),
                        color: AppColorLight.mainColor, // هيتغير
                      ),
                    ),
                  ),
                ],
              ),
              Custumelevatedbutton(
                backgroundcolor: AppColorLight.mainColor,

                child: Text(
                  "login".tr(),
                  style: TextStyle(
                    color: AppColorLight.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight(600),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routemanger.registerRoute);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "dont_have_account".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight(400),
                      fontSize: 14.sp,
                      color: AppColorLight.secondaryText,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // context.pushRoute(RegisterRoute());
                      // if (formkey.currentState!.validate()) {
                      //   context.pushRoute(RegisterRoute());
                      // }
                    },
                    child: Text(
                      "signup".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight(400),
                        fontSize: 14.sp,
                        color: AppColorLight.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "or".tr(),
                style: TextStyle(
                  fontWeight: FontWeight(400),
                  fontSize: 16.sp,
                  color: AppColorLight.mainColor,
                ),
              ),
              Custumelevatedbutton(
                backgroundcolor: AppColorLight.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10.w,
                  children: [
                    Image.asset(ImageManager.google, width: 24.sp, height: 24.sp),
                    Text(
                      "login_with_google".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight(500),
                        fontSize: 18.sp,
                        color: AppColorLight.mainColor,
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
