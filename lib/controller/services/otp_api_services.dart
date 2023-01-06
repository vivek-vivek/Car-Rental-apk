// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:rent_ro/controller/services/api_urls.dart';
// import 'package:rent_ro/model/otp_model.dart';
// import 'package:rent_ro/view/screens/verification_screen.dart';

// class OtpApiServices {
//   /// OtpApiServices
//   /// Use Dio to post the data to the API.
//   /// get the mobile number from the textformfield and make and verify
//   Future otpApiServices({
//     required mobile,
//     required otp,
//     required context,
//   }) async {
//     try {
//       log('1');
//       //createing a otpmodel instanse
//       OtpModel otpModel = OtpModel(mobile: mobile, otp: otp);
//       //post values to server & get response
//       Response response =
//           await Dio().post(baseUrl + auth + otpVerify, data: otpModel.toJson());

//       log("------------------");
//       log(response.statusCode.toString());
//       if (response.statusCode == 202) {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: const Text("OTP IS NOT CORRECT"),
//               content: const Text("Please renter the otp"),
//               actions: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text("back"),
//                 )
//               ],
//             );
//           },
//         );
//       } else {
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(
//               builder: (context) => VerificationScreen(),
//             ),
//             (route) => false);
//       }
//     } catch (error) {
//       log(error.toString());
//     }
//   }
// }
