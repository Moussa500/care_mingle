import 'package:care_mingle/core/common/widgets/custom_appBar.dart';
import 'package:care_mingle/core/config/assets/app_images.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:care_mingle/features/home/presentation/widgets/article_section.dart';
import 'package:care_mingle/features/home/presentation/widgets/babysitter_section.dart';
import 'package:care_mingle/features/home/presentation/widgets/top_rated_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  AppImages.article,
                  fit: BoxFit.fill,
                  height: 50,
                  width: 50,
                ),
              ),
              header('Hi,Krystina'),
            ],
          ),
        ),
        action: const Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            Icons.notifications,
            size: 30,
            color: AppColors.primaryColor,
          ),
        ),
        hideBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ArticleSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                header('BabySitters'),
                seeAll(),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            BabysitterSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                header('Top rated'),
                seeAll(),
              ],
            ),
            TopRatedSection(),
          ],
        ),
      ),
    );
  }

  Padding seeAll() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Text(
        'See all',
        style: TextStyle(color: const Color(0xffF1A3B6), fontSize: 20.sp),
      ),
    );
  }

  Padding header(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff939393)),
        ),
      ),
    );
  }
}
