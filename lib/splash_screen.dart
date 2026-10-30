import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // These colors are taken from the logo, so the splash matches it exactly
  static const Color _backgroundColor = Color(0xFFF4FEFF);
  static const Color _textColor = Color(0xFF538CE7);

  @override
  void initState() {
    super.initState();
    _goToHome();
  }

  // Wait, then open the Home screen. pushReplacement removes the splash
  // from history, so the Back button will not return to it.
  Future<void> _goToHome() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    if (!mounted) return; // do nothing if the screen is already closed

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        // Fade into the Home screen instead of a sudden jump
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Center(
        // TweenAnimationBuilder runs the animation from 0 to 1 once
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1400),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            return Opacity(
              // easeOutBack can go slightly above 1, so we keep opacity safe
              opacity: value.clamp(0.0, 1.0),
              child: Transform.scale(
                scale: 0.6 + (0.4 * value), // grows from 60% to 100%
                child: child,
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/quotelogo.png', width: 200, height: 200),
              const SizedBox(height: 12),
              const Text(
                'QuoteSpark',
                style: TextStyle(
                  color: _textColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'A spark of wisdom, every day',
                style: TextStyle(color: Color(0xFF7C7A99), fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
