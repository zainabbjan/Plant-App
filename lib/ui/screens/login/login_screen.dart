import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/core/color/color.dart';
import 'package:plant_app/ui/screens/root/root_screen.dart';
import 'package:plant_app/ui/screens/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('asset/greenry.jpg')),
            ),
          ),
        ),
        Positioned(
          top: 40.h,
          left: 20.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.white),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: kDarkgreenColor,
              ),
            ),
          ),
        ),
        Stack(
          children: [
            Positioned(
              top: 310.h,
              left: 70.w,
              child: Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: kDarkgreenColor,
                ),
              ),
            ),
            Positioned(
                top: 310.h,
                right: 34.w,
                child: SizedBox(
                    height: 70.h,
                    width: 100.w,
                    child: Image(
                      image: AssetImage('asset/leave.png'),
                    ))),
            Positioned(
                top: 310.h,
                right: 0.w,
                child: SizedBox(
                    height: 70.h,
                    width: 100.w,
                    child: Image(
                      image: AssetImage('asset/leave.png'),
                    ))),
            Positioned(
                top: 350.h,
                left: 1009.w,
                child: Text(
                  'Login to your account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )),
          ],
        ),
        Positioned(
          top: 400.h,
          child: Container(
            height: 150,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CustomTextField(
                  hintText: 'Full name',
                  icon: Icons.person,
                  obscureText: false,
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomTextField(
                    icon: Icons.lock,
                    obscureText: true,
                    hintText: 'Enter your password'),
              ],
            ),
          ),
        ),
        Positioned(
          top: 520.h,
          left: 30.w,
          child: Row(
            children: [
              Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: kDarkgreenColor),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              Text(
                'Remember me',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Positioned(
          top: 520.h,
          right: 35.w,
          child: Text(
            'Forgot Password?',
            style:
                TextStyle(color: kDarkgreenColor, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            top: 700.h,
            right: 35.w,
            left: 35.w,
            child: GestureDetector(
              onTap: (() {
                Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: const RootPage(),
                        type: PageTransitionType.bottomToTop));
              }),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                height: 50.h,
                width: size.width,
                decoration: BoxDecoration(
                  color: kDarkgreenColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Text(
                  ' Login in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            )),
        Positioned(
          top: 750.h,
          left: 90.w,
          child: Row(
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.grey, fontSize: 15.sp),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(
                  //   const RegisterScreen(),
                  // );

                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const RegisterScreen(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      color: kDarkgreenColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          color: kDarkgreenColor,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: kDarkgreenColor,
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 55.0);
    var p1 = Offset(size.width / 4, size.height);
    var p2 = Offset(size.width - 0.04, size.height - 90.0);

    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
