import 'package:care_mingle/features/auth/presentation/register/bloc/bloc/register_bloc.dart';
import 'package:care_mingle/features/auth/presentation/widgets/baby_sitter_additional.dart';
import 'package:care_mingle/features/auth/presentation/widgets/register_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              children: const [
                RegisterPageWidget(),
                BabySitterAdditional(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 2,
              effect: const WormEffect(),
            ),
          )
        ],
      ),
    );
  }
}
