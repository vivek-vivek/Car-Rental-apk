import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rent_ro/colors.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/model/signup_model.dart';
import 'package:rent_ro/view/screens/otp_screen.dart';

class SignUpApiServices {
  /// SignUpApiServices
  /// Use Dio to post the data to the API.
  /// get values form the UI screen and make a new user
  /// if the user not alredy exisists.
  Future signUpApiServices(
      {required name,
      required mobile,
      required email,
      required password,
      required context}) async {
    try {
      log("signUpApiServices function work ayyyi");

      // Create an instance of the SignupModel class
      SignupModel signupModel = SignupModel(
        name: name,
        mobile: mobile,
        email: email,
        password: password,
      );
      // This will genarate a response from the api
      Response response =
          await Dio().post(baseUrl + auth + signup, data: signupModel.toJson());
      // Printing the response from the above function
      log("status code -${response.statusCode}");
      log("Response from the - signUpApiServices \n${response.data}\n");

      if (response.statusCode == 202) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: kBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(15.0),
            elevation: 6.0,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            content: const Text('User already exist'),
          ),
        );
      } else if (response.statusCode! == 201) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return OTPScreen(
                mobile: mobile,
              );
            },
          ),
        );
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
