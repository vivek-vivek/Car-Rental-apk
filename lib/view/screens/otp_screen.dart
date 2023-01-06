import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:rent_ro/colors.dart';
import 'package:rent_ro/controller/services/otp_api_services.dart';
import 'package:rent_ro/view/widgets/decorations.dart';
import 'package:rent_ro/view/widgets/header_div.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key, required this.mobile}) : super(key: key);
  final mobile;
  final otpTextEditingController = TextEditingController();
  final focusNode = FocusNode();
  final formKeyForOtpVerification = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKeyForOtpVerification,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HeaderDiv(respHeight: respHeight),
                    Image.asset('lib/view/assets/carLogo.png',
                        height: respHeight * 0.2),
                    HeaderDiv(respHeight: respHeight),
                  ],
                ),
                Text(
                  "VERIFY YOUR OTP",
                  style: GoogleFonts.abrilFatface(
                      fontSize: respHeight * 0.08, color: kBlack),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: respHeight * 0.2, bottom: respHeight * 0.05),
                  child: Container(
                    padding: EdgeInsets.only(top: respHeight * 0.04),
                    height: respHeight * 0.28,
                    width: respHeight * 0.85,
                    decoration: kBoxDecoration(respHeight: respHeight),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        focusNode: focusNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        controller: otpTextEditingController,
                        defaultPinTheme: PinTheme(
                            width: 65,
                            height: 65,
                            textStyle: const TextStyle(
                              fontSize: 22,
                              color: kBlack,
                            ),
                            decoration: kBoxDecoration(respHeight: respHeight)),
                        validator: (value) {
                          if (value!.length < 4) {
                            return 'Enter 4 digit OTP';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: respHeight * 0.1),
                  child: Column(
                    children: [
                      Container(
                        height: respHeight * 0.2,
                        width: respHeight * 0.75,
                        decoration: kBoxDecoration(
                            respHeight: respHeight, color: kBlack),
                        child: TextButton(
                          onPressed: () {
                            if (formKeyForOtpVerification.currentState!
                                .validate()) {
                              // OtpApiServices().otpApiServices(
                              //     mobile: mobile,
                              //     otp: otpTextEditingController.text,
                              //     context: context);
                            }
                            log(otpTextEditingController.text);
                          },
                          child: Text(
                            'SUBMIT',
                            style: GoogleFonts.abrilFatface(
                                fontSize: respHeight * 0.04, color: kWhite),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
