import 'package:care_mingle/core/config/assets/app_images.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BabysitterSection extends StatelessWidget {
  BabysitterSection({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffEDEDF1),
                  borderRadius: BorderRadius.all(Radius.circular(20.r))),
              height: 180.h,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: ClipOval(
                                  child: Image.asset(
                                    height: 50.h,
                                    width: 50.w,
                                    AppImages.article,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      babysitterName(),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      price(),
                                      rating()
                                    ],
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(right: 125.w),
                                    child: location(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        description(
                            'Bio : Lorem ipsum dolor sit amet, consectetur /n adipiscing elit.'),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          child: FittedBox(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 250.w,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)))),
                                      onPressed: () {},
                                      child: Text(
                                        'Read article',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffEDEDF1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.r),
                                            ),
                                            side: const BorderSide(
                                                color: AppColors.primaryColor,
                                                width: 1))),
                                    child: Text(
                                      "Message",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Text babysitterName() {
    return Text(
      'Mirs Krystina',
      style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff939393)),
    );
  }

  Text price() {
    return const Text(
      '20/Hr',
      style: TextStyle(color: AppColors.primaryColor),
    );
  }

  Widget location() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on,
          color: AppColors.primaryColor,
        ),
        Text('Plough Close.'),
      ],
    );
  }

  Row rating() {
    return const Row(
      children: [
         SizedBox(
          width: 20,
        ),
        Icon(
          Icons.star_outlined,
          color: Colors.yellow,
        ),
        Text('4.1')
      ],
    );
  }

  Widget articleTitle(String label) {
    return Text(
      textAlign: TextAlign.start,
      label,
      style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 17.sp,
          fontWeight: FontWeight.w500),
    );
  }

  Widget description(String content) {
    return Text(
      overflow: TextOverflow.clip,
      textAlign: TextAlign.start,
      content,
      style: TextStyle(
          color: const Color(0xff949494),
          fontSize: 15.sp,
          fontWeight: FontWeight.w400),
    );
  }
}
