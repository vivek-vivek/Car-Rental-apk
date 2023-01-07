import 'dart:developer';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/view/screens/home_screen.dart';
import 'package:rent_ro/view/screens/sign_up_screen.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  bool isLoggedIn;

  SplashScreen({
    super.key,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    log(isLoggedIn.toString());
    final respHeight = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Text(
        'RENTRO',
        style: GoogleFonts.abrilFatface(fontSize: respHeight * 0.1),
      ),
      nextScreen: isLoggedIn ? const HomeScreen() : const SignupScreen(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
