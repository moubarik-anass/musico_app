import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/common/widgets/button/basic_app_button.dart';
import 'package:music_app/core/configs/assets/app_images.dart';
import 'package:music_app/core/configs/assets/app_vectors.dart';
import 'package:music_app/core/configs/theme/app_colors.dart';
import 'package:music_app/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            AppImages.introBG,
            fit: BoxFit.cover,
          ),

          // Black overlay
          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40,
            ),
            child: Column(
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                  height: 60, // Ajoute une taille raisonnable
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 21),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseModePage(),
                      ),
                    );
                  },
                  title: 'Get Started',
                  color: const Color(0xFF9FB3DF),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
