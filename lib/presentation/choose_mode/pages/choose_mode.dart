import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/presentation/auth/pages/signup_or_siginin.dart';
import 'package:music_app/presentation/choose_mode/bloc/theme_cubit.dart';

import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';
import '../../../core/configs/theme/app_colors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AppImages.chooseModeBG,
                    ))),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Logo
                  SvgPicture.asset(AppVectors.logo, height: 60),

                  // Flexible space that takes up available room
                  const Spacer(flex: 2),

                  // Choose Mode text
                  const Text(
                    'Choose Mode',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  const SizedBox(height: 30),

                  // Mode selection row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildModeOption(
                        context,
                        'Dark Mode',
                        AppVectors.moon,
                        ThemeMode.dark,
                      ),
                      const SizedBox(width: 40),
                      _buildModeOption(
                        context,
                        'Light Mode',
                        AppVectors.sun,
                        ThemeMode.light,
                      ),
                    ],
                  ),

                  // Flexible space that takes up available room
                  const Spacer(flex: 1),

                  // Continue button
                  BasicAppButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignupOrSigninPage()));
                    },
                    title: 'Continue',
                    color: const Color(0xFF9FB3DF),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeOption(
    BuildContext context,
    String title,
    String iconAsset,
    ThemeMode mode,
  ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().updateTheme(mode);
          },
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 70, // Légèrement réduit
                width: 70, // Légèrement réduit
                decoration: BoxDecoration(
                    color: const Color(0xff30393C).withOpacity(0.5),
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  iconAsset,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.grey),
        )
      ],
    );
  }
}
