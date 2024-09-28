import 'package:care_mingle/core/config/assets/app_images.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/register_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.intro,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 375,
              decoration: const BoxDecoration(
                  color: Color(0xffFAF0F2),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Peace of Mind For Busy Parents",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Ensuring a safe and happy experience for your children by getting the best sitter for them, one click at a time.",
                    style: TextStyle(
                        color: const Color(0xff939393),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage())),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(271.w, 54.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r))),
                    child: Text(
                      "Let's Get Started",
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
