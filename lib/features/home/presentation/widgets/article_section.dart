import 'package:care_mingle/core/config/assets/app_images.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ArticleSection extends StatelessWidget {
  ArticleSection({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 160.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffEDEDF1),
                      borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  height: 155.w,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 200,
                              height: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  articleTitle("New article"),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  description(
                                      'Lorem ipsum dolor sit amet, consectetur /n adipiscing elit.'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FittedBox(
                                    child: SizedBox(
                                      width: 200.w,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)))),
                                          onPressed: () {},
                                          child: Text(
                                            'Read article',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Image.asset(
                              height: 200.h,
                              width: 200.w,
                              AppImages.article,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20.h,),
        SmoothPageIndicator(controller: _pageController, count: 3,effect: const ExpandingDotsEffect(activeDotColor: AppColors.primaryColor,dotColor: Color(0xffD8B8D1)),)
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
