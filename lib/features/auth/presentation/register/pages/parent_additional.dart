import 'package:care_mingle/arguments.dart';
import 'package:care_mingle/core/config/assets/app_images.dart';
import 'package:care_mingle/features/auth/data/models/user_model.dart';
import 'package:care_mingle/features/auth/domain/entities/user_entity.dart';
import 'package:care_mingle/features/auth/domain/usecases/register.dart';
import 'package:care_mingle/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:care_mingle/common/widgets/custom_appBar.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_drop_down_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentAdditional extends StatefulWidget {
  const ParentAdditional({super.key});

  @override
  _ParentAdditionalState createState() => _ParentAdditionalState();
}

class _ParentAdditionalState extends State<ParentAdditional> {
  int _numberOfChildren = 0;
  List<Map<String, dynamic>> childrenData = [];
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegisterArguments;
        print(args.password);
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Text(
                "Register your \n children",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Add your children’s age and gender to help babysitters review your request (optional)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff939393),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 30.h),
              SizedBox(
                height: 60.h,
                width: 350.w,
                child: CustomDropDownMenu<int>(
                  hintText: "Number of Children",
                  value: _numberOfChildren > 0 ? _numberOfChildren : null,
                  items: List.generate(5, (index) => index + 1)
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (int? newValue) {
                    setState(() {
                      _numberOfChildren = newValue ?? 0;
                      childrenData = List.generate(
                        _numberOfChildren,
                        (_) => {"age": null, "gender": null},
                      );
                    });
                  },
                ),
              ),
              SizedBox(height: 40.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _numberOfChildren,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 61.h,
                            width: 160.w,
                            child: CustomDropDownMenu<int>(
                              hintText: "Age",
                              items: List.generate(10, (index) => index + 1)
                                  .map<DropdownMenuItem<int>>((int value) {
                                return DropdownMenuItem<int>(
                                  value: value,
                                  child: Text(value.toString()),
                                );
                              }).toList(),
                              onChanged: (int? selectedAge) {
                                setState(() {
                                  childrenData[index]['age'] = selectedAge;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 30.h),
                          SizedBox(
                            height: 61.h,
                            width: 160.w,
                            child: CustomDropDownMenu<String>(
                              hintText: "Gender",
                              items: const [
                                "male",
                                "female"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? selectedGender) {
                                setState(() {
                                  childrenData[index]['gender'] =
                                      selectedGender;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50.h),
              ElevatedButton(
                onPressed: () async {
                  print(args.password);
                  try {
                    var result = await sl<RegisterParentUseCase>().call(
                        params: ParentModel(
                            name: args.name,
                            email: args.email,
                            phone: args.phone,
                            address: args.address,
                            password: args.password,
                            status: "unbanned",
                            profilePic: AppImages.intro,
                            role: "parent",
                            children: childrenData));
                    result.fold((left) {
                      print({left});
                    }, (right) {
                      print({right});
                    });
                  } catch (e) {
                    print("error:$e");
                  }
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
    );
  }
}
