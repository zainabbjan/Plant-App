import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plant_app/ui/screens/login/login_screen.dart';
import 'package:plant_app/ui/screens/root/root_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => ChangeNotifierProvider(
        create: (BuildContext context) => RootViewModel(),
        child: const GetMaterialApp(
          title: "Sign up",
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,  
        ),
      ),
    );
  }
}
