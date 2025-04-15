import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/core/configs/assets/app_vectors.dart';
import 'package:music_app/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialiser l'animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Démarrer l'animation
    _controller.forward();

    // Planifier la navigation après l'animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      redirect();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                  width: 120,
                  height: 120,
                ),
                Transform.translate(
                  offset: const Offset(0,
                      -25), // Valeur augmentée pour déplacer le titre plus haut
                  child: Text(
                    "Musico",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: const Color(0xFF9FB3DF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 20));

    // Vérifier si le widget est toujours monté
    if (!mounted) return;

    // Utiliser Navigator.of(context) pour éviter des problèmes de contexte
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const GetStartedPage(),
      ),
    );
  }
}
