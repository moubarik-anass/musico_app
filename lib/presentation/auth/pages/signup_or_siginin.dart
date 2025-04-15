import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/common/helpers/is_dark_mode.dart';
import 'package:music_app/common/widgets/button/basic_app_button.dart';
import 'package:music_app/core/configs/assets/app_images.dart';
import 'package:music_app/core/configs/assets/app_vectors.dart';
import 'package:music_app/core/configs/theme/app_colors.dart';
import 'package:music_app/presentation/auth/pages/signin.dart';
import 'package:music_app/presentation/auth/pages/signup.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background elements
          const BasicAppbar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),

          // Main content
          SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Use minimum vertical space
                  children: [
                    // Logo with controlled size
                    SvgPicture.asset(
                      AppVectors.logo,
                      height: 60, // Control logo size
                    ),
                    const SizedBox(height: 40),

                    // Main text
                    const Text(
                      'Enjoy Listening To Music',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),

                    // Subtitle with constrained width
                    const SizedBox(
                      width: 300,
                      child: Text(
                        'Spotify is a proprietary Swedish audio streaming and media services provider',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: AppColors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: BasicAppButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignupPage()));
                            },
                            title: 'Register',
                            color: const Color(0xFF9FB3DF),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SigninPage()));
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: context.isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
