import 'package:care_mingle/core/config/theme/app_theme.dart';
import 'package:care_mingle/core/route/app_routes.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/register_Page.dart';
import 'package:care_mingle/features/auth/presentation/widgets/baby_sitter_additional.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/login_page.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/parent_additional.dart';
import 'package:care_mingle/features/auth/presentation/widgets/register_page_widget.dart';
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
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        routerConfig: AppRoutes.router,
    ),
    );
  }
}