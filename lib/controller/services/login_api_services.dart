import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/view/screens/verification_screen.dart';

class LoginApiServices {
  Future loginApiServices({mobile, password, context}) async {
    Response response = await Dio().post(baseUrl + auth + loginMobile, data: {
      "mobile": mobile,
      "password": password,
    });
    if (response.statusCode == 201) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const VerificationScreen(),
          ),
          (route) => false);
    } else if (response.statusCode == 400) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("OTP IS NOT CORRECT"),
            content: const Text("Please renter the otp"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("back"),
              )
            ],
          );
        },
      );
    }
  }
}
