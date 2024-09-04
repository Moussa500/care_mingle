import 'package:care_mingle/core/config/theme/app_theme.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/baby_sitter_additional.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/login_page.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/parent_additional.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/register_page.dart';
import 'package:care_mingle/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize:  const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
      initialRoute: '/',
      routes: {
        '/':(context)=>HomePage(),
        '/login':(context)=>const LoginPage(),
        '/register':(context)=>const RegisterPage(),
        '/parentAdditional':(context)=>const ParentAdditional(),
        '/babySitterAdditional':(context)=>const BabySitterAdditional(),
      },
    ),
    );
  }
}