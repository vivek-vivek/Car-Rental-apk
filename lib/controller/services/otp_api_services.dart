import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/model/otp_model.dart';
import 'package:rent_ro/view/screens/home_screen.dart';
import 'package:rent_ro/view/screens/verification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpApiServices {
  /// OtpApiServices
  /// Use Dio to post the data to the API.
  /// get the mobile number from the textformfield and make and verify
  Future otpApiServices({
    required mobile,
    required otp,
    required context,
  }) async {
    try {
      log('1');
      //createing a otpmodel instanse
      OtpModel otpModel = OtpModel(mobile: mobile, otp: otp);
      //post values to server & get response
      Response response =
          await Dio().post(baseUrl + auth + otpVerify, data: otpModel.toJson());

      log(response.statusCode.toString());
      if (response.statusCode == 202) {
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
      } else {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      } //Handling network connection error-------->

    } on SocketException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
            child: AlertDialog(
          content: Text('No internet connection'),
        )),
      );

      //Handling timeout error---------->

    } on TimeoutException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: AlertDialog(
            content: Text('No internet connection '),
          ),
        ),
      );
    } on DioError catch (e) {
      if (e.response == null) {
        Navigator.of(context).pop();
        return showDialog(
          context: context,
          builder: (context) => const Center(
            child: AlertDialog(
              content: Text('No internet connection '),
            ),
          ),
        );
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
