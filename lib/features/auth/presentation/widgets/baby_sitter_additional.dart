import 'package:care_mingle/arguments.dart';
import 'package:care_mingle/core/config/assets/app_vectors.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:care_mingle/features/auth/domain/repository/auth_repository.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:care_mingle/core/common/widgets/custom_appBar.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BabySitterAdditional extends StatefulWidget {
  const BabySitterAdditional({super.key});
  @override
  _BabySitterAdditionalState createState() => _BabySitterAdditionalState();
}
class _BabySitterAdditionalState extends State<BabySitterAdditional> {
  List<int> availability = [];
  List<String> days = [
    "Monday",
    "Thuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Help Parents hire \n you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(height: 30.h),
                Text(
                  "help parents to hire you by filing those information",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff939393),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppVectors.uploadResume,
                    width: 306.w,
                    height: 137.h,
                  ),
                ),
                header("Availability"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                availability.add(index);
                              },
                              child: day(days[index]));
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 7.w),
                        itemCount: 7),
                  ),
                ),
                header("Bio"),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                  child: const CustomTextfield(
                    hintText: "",
                    maxLines: 5,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(261.w, 54.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
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

  Container day(String day) => Container(
        height: 31.h,
        width: 77.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: const Color(0xffF0F0F4),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color(0xff939393),
            ),
          ),
        ),
      );
}
