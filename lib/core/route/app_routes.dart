import 'package:care_mingle/core/base/base_cache.dart';
import 'package:care_mingle/core/consts/api_constants.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/login_page.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/register_Page.dart';
import 'package:care_mingle/features/auth/presentation/widgets/register_page_widget.dart';
import 'package:care_mingle/features/home/presentation/pages/home_page.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const home = '/';
  static const loginPage = '/loginPage';
  static const signUpPage = '/signUpPage';
  static animatedPage(
      BuildContext context, GoRouterState state, Widget widget) {
    return CustomTransitionPage(
        key: state.pageKey,
        child: widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        });
  }

  static final GoRouter router = GoRouter(
      initialLocation: signUpPage,
      navigatorKey: GlobalKey<NavigatorState>(),
      errorBuilder: (BuildContext context, GoRouterState state) {
        return  RegisterPage();
      },
      routes: [
        GoRoute(
            name: home,
            path: home,
            builder: (context, state) => const HomePage(),
            pageBuilder: (context, state) =>
                animatedPage(context, state, const HomePage())),
        GoRoute(
            name: loginPage,
            path: loginPage,
            builder: (context, state) => const LoginPage(),
            pageBuilder: (context, state) =>
                animatedPage(context, state, const LoginPage())),
        GoRoute(
            name: signUpPage,
            path: signUpPage,
            builder: (context, state) =>  RegisterPage(),
            pageBuilder: (context, state) =>
                animatedPage(context, state,  RegisterPage())),
      ],
     /* redirect: (BuildContext context, GoRouterState state) async {
        final isAuthenticated =
            await sl<LocalData>().checkExistance(accessToken);
        if (!isAuthenticated) {
          return loginPage;
        } else {
          return home;
        }
      }*/);
}
