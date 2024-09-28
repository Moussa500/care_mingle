import 'package:care_mingle/core/common/helpers/form_helper.dart';
import 'package:care_mingle/core/common/widgets/custom_appBar.dart';
import 'package:care_mingle/core/config/theme/app_colors.dart';
import 'package:care_mingle/features/auth/presentation/register/bloc/bloc/register_bloc.dart';
import 'package:care_mingle/features/auth/presentation/register/pages/login_page.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_drop_down_menu.dart';
import 'package:care_mingle/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPageWidget extends StatefulWidget {
  const RegisterPageWidget({super.key});
  @override
  State<RegisterPageWidget> createState() => _RegisterPageWidgetState();
}

String? role;

class _RegisterPageWidgetState extends State<RegisterPageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final isValid =
            context.select((RegisterBloc bloc) => bloc.state.isValid);
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
                    textError: state.firstName.displayError != null
                        ? "¨Please enter a valid Name like 'Marko'"
                        : null,
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(FirstNameChange(firstName: value));
                    },
                    hintText: "Name",
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  CustomTextfield(
                    initialValue: state.email.value,
                    textError: state.email.displayError != null
                        ? "¨Please enter a valid email like 'exemple@gmail.com"
                        : null,
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(EmailChange(email: value));
                    },
                    hintText: "Email",
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  CustomTextfield(
                    initialValue: state.password.value,
                    textError: state.password.displayError != null
                        ? state.password.error == PasswordValidationError.empty
                            ? "Please Enter a password"
                            : "Please Enter a strong password"
                        : null,
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(PasswordChange(password: value));
                    },
                    hintText: "Password",
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  CustomTextfield(
                    initialValue: state.address.value,
                    textError: state.address.displayError != null
                        ? "Please Enter an address"
                        : null,
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(AddressChange(address: value));
                    },
                    hintText: "Address",
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  CustomTextfield(
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(PhoneNumberChange(phoneNumber: value));
                    },
                    initialValue: state.phoneNumber.value,
                    textError: state.phoneNumber.displayError != null
                        ? state.phoneNumber.error ==
                                PhoneNumberValidatorError.empty
                            ? "Please Enter your phone Number"
                            : "Please Enter a valid phone number"
                        : null,
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
                    onChanged: (String? selectedRole) {
                      setState(() {
                        role = selectedRole;
                        context
                            .read<RegisterBloc>()
                            .add(RoleChange(role: role!));
                      });
                    },
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      isValid
                          ? context
                              .read<RegisterBloc>()
                              .add(ToggleButtonPressed(pageIndex: 1))
                          : ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Please make sure that all fields correct")));
                      print(state.email.value);
                      print(state.password.value);
                      print(state.address.value);
                      print(state.phoneNumber.value);
                      print(state.role.value);
                      print(state.firstName.value);
                      print(isValid);
                    },
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
      },
    );
  }
}
