import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/controller/services/api_urls.dart';
import 'package:rent_ro/view/screens/home_screen.dart';
import 'package:rent_ro/view/screens/verification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiServices {
  Future loginApiServices({mobile, password, context}) async {
    try {
      Response response = await Dio().post(baseUrl + auth + loginMobile, data: {
        "mobile": mobile,
        "password": password,
      });
      if (response.statusCode == 201) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      } else if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("OTP IS INCORRECT"),
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

      //Handling network connection error-------->

    } on SocketException {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("NO INTERNET CONECTION"),
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

      //Handling timeout error---------->

    } on TimeoutException {
      dialogs(context: context, title: "No Internet conction");
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        dialogs(
          context: context,
          title: "INCORRECT MOBILE NUMMBER OR PASSWORD",
          content: "Please renter the details",
        );
      }

      if (e.response == null) {
        return dialogs(context: context, title: "No Internet conction");
      }
    } catch (error) {
      log(error.toString());
    }
  }

  Future<dynamic> dialogs(
      {String title = '', String content = '', required context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.anybody(fontSize: 20),
          ),
          content: Text(
            content,
            style: GoogleFonts.anybody(),
          ),
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
