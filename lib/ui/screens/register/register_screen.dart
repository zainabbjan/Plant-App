import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/core/color/color.dart';

import '../root/root_screen.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const LoginScreen(),
                      type: PageTransitionType.bottomToTop));
            },
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              height: 30.h,
              width: 30.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: klightgreenColor),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: kDarkgreenColor,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Stack(
            children: [
              Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kDarkgreenColor,
                  ),
                ),
              ),
              Positioned(
                right: 40.w,
                child: SizedBox(
                    height: 70.h,
                    width: 100.w,
                    child: Image(
                      image: AssetImage('asset/leave.png'),
                    )),
              ),
              Positioned(
                right: 0.w,
                child: SizedBox(
                    height: 70.h,
                    width: 100.w,
                    child: Image(
                      image: AssetImage('asset/leave.png'),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Center(
            child: Text(
              'Create your new account',
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: klightgreenColor),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: 250,
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CustomTextField(
                  hintText: 'Full name',
                  icon: Icons.person,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomTextField(
                    icon: Icons.email, obscureText: false, hintText: 'Email'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    icon: Icons.lock,
                    obscureText: true,
                    hintText: 'Enter your password'),
                const SizedBox(
                  height: 5,
                ),
                const CustomTextField(
                    icon: Icons.lock,
                    obscureText: true,
                    hintText: 'Comfirm Password')
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "By Signing you agree to our ",
                    style: TextStyle(color: kDarkgreenColor, fontSize: 15.sp),
                  ),
                  TextSpan(
                    text: "Team of use\n",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and",
                    style: TextStyle(color: kDarkgreenColor, fontSize: 15.sp),
                  ),
                  TextSpan(
                    text: " Privacy notice ",
                    style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: (() {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const RootPage(),
                      type: PageTransitionType.bottomToTop));
            }),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                color: kDarkgreenColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                  child: Text(
                ' Sign up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              )),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(color: kgreenColor, fontSize: 15.sp),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: "Sign in",
                    style: TextStyle(
                        color: kDarkgreenColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
        ],
      ),
    );
  }
}
