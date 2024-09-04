import 'package:care_mingle/common/widgets/custom_appBar.dart';
import 'package:care_mingle/features/home/presentation/widgets/article_section.dart';
import 'package:care_mingle/features/home/presentation/widgets/babysitter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        action: Icon(
          Icons.notifications,
        ),
        hideBack: true,
      ),
      body: Column(
        children: [
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
        ],
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
