import 'package:care_mingle/core/common/widgets/custom_appBar.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Login',
          style: TextStyle(
              fontSize: 25.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome back',
                style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            const CustomTextfield(
              hintText: "Email",
            ),
            SizedBox(
              height: 60.h,
            ),
            const CustomTextfield(
              hintText: "Password",
            ),
            SizedBox(
              height: 37.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password ?",
                  style: TextStyle(color: Color(0xff939393), fontSize: 16.sp),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(271.w, 54.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r))),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account ?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff939393),
                  ),
                ),
                SizedBox(
                  height: 67.h,
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
