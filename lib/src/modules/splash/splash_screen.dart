import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:monawpaty/src/modules/otp/otp_screen.dart';
import '../welcome/welcome_screen.dart';

class SplashScreeen extends StatelessWidget {
  const SplashScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
      splash: Image.asset("assets/images/logo.png"),
      nextScreen: OtpScreen(
        phoneNumber: '0000000000000',
        verificationId: '00',
      ),
      duration: 1000,
      animationDuration: const Duration(seconds: 2),
      splashIconSize: 200,
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.white,
    ));
  }
}
