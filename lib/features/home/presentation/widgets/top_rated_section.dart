import 'package:care_mingle/core/config/assets/app_images.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 200.h,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 17,
                ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 335.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F4F4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const ClipOval(
                            child: Image(
                              image: AssetImage(AppImages.article),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    babysitterName(),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    price(),
                                  ],
                                ),
                              ),
                              rating(),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
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
      Text('4.9/808 reviews')
    ],
  );
}
