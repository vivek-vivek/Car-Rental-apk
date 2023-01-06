import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/view/screens/sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignupScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text(
          'RENTRO',
          style: GoogleFonts.abrilFatface(fontSize: respHeight * 0.2),
        ),
      ),
    );
  }
}
