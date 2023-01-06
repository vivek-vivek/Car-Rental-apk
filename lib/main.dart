import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/provider/login_provider.dart';
import 'package:rent_ro/controller/provider/otp_provider.dart';
import 'package:rent_ro/controller/provider/signup_provider.dart';
import 'package:rent_ro/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignupProvider>(create: (_) => SignupProvider()),
        ChangeNotifierProvider<OtpProvider>(create: (_) => OtpProvider()),
        ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
