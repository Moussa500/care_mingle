import 'package:care_mingle/arguments.dart';
import 'package:care_mingle/common/widgets/custom_appBar.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/login_page.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_drop_down_menu.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

String? role;
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController name = TextEditingController();

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Register',
          style: TextStyle(
              fontSize: 25.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomTextfield(
                controller: name,
                hintText: "Name",
              ),
              SizedBox(
                height: 44.h,
              ),
              CustomTextfield(
                controller: email,
                hintText: "Email",
              ),
              SizedBox(
                height: 44.h,
              ),
              CustomTextfield(
                controller: password,
                hintText: "Password",
              ),
              SizedBox(
                height: 44.h,
              ),
              CustomTextfield(
                controller: address,
                hintText: "Address",
              ),
              SizedBox(
                height: 44.h,
              ),
              CustomTextfield(
                controller: phone,
                hintText: "Phone Number",
              ),
              SizedBox(
                height: 44.h,
              ),
              CustomDropDownMenu<String>(
                hintText: "Role",
                items: const ["parent", "babysitter"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? selectedGender) {
                  setState(() {
                    role = selectedGender;
                  });
                },
              ),
              SizedBox(
                height: 44.h,
              ),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(
                    context,
                    role == "parent"
                        ? "/parentAdditional"
                        : "/babySitterAdditional",
                    arguments: RegisterArguments(
                        email: email.text,
                        password: password.text,
                        name: name.text,
                        address: address.text,
                        phone: phone.text)),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(271.w, 54.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r))),
                child: Text(
                  "Next      ->",
                  style: TextStyle(fontSize: 18.sp, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account ?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff939393),
                    ),
                  ),
                  SizedBox(
                    height: 67.h,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage())),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
