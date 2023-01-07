import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/view/widgets/colors.dart';
import 'package:rent_ro/controller/provider/login_provider.dart';
import 'package:rent_ro/controller/services/login_api_services.dart';
import 'package:rent_ro/view/screens/otp_screen.dart';
import 'package:rent_ro/view/screens/sign_up_screen.dart';
import 'package:rent_ro/view/widgets/containers.dart';
import 'package:rent_ro/view/widgets/decorations.dart';
import 'package:rent_ro/view/widgets/header_div.dart';
import 'package:rent_ro/view/widgets/snak_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    final prvLogin = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: respHeight * 0.05,
          ),
          children: [
            // SIzedbox for defining company name
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeaderDiv(respHeight: respHeight),
                Image.asset('lib/view/assets/carLogo.png',
                    height: respHeight * 0.2),
                HeaderDiv(respHeight: respHeight),
              ],
            ),

            Center(
              child: Text(
                'WELCOME  BACK !',
                style: GoogleFonts.abrilFatface(fontSize: respHeight * 0.07),
              ),
            ),
            kContainer(xHeight: respHeight * 0.03, xColor: kWhite),
            Form(
              key: Provider.of<LoginProvider>(context).loginFormKey,
              child: Padding(
                padding: EdgeInsets.only(top: respHeight * 0.1),
                child: Container(
                  decoration: kBoxDecoration(respHeight: respHeight),
                  height: respHeight * 0.9,
                  width: respHeight * 0.3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: respHeight * 0.045,
                        vertical: respHeight * 0.036),
                    child: ListView(
                      children: [
                        kContainer(xHeight: respHeight * 0.03),
                        //Name - TextformFeild
                        TextFormField(
                            // keyboardType: TextInputType.phone,
                            validator: (value) => Provider.of<LoginProvider>(
                                    context,
                                    listen: false)
                                .phoneNumberValidation(value),
                            controller: Provider.of<LoginProvider>(context)
                                .mobileController,
                            cursorColor: kBlack,
                            decoration:
                                kInputDecoration(respHeight, 'Phone Number')),

                        kContainer(xHeight: respHeight * 0.06),
                        TextFormField(
                          validator: (value) =>
                              Provider.of<LoginProvider>(context, listen: false)
                                  .passwordValidation(value!),
                          controller: Provider.of<LoginProvider>(context)
                              .passwordController,
                          obscureText: Provider.of<LoginProvider>(
                            context,
                          ).passwordVisible, //This will obscure text dynamically
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.anybody(color: kBlack),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(respHeight * 0.02)),
                              borderSide: BorderSide(
                                  width: respHeight * 0.003, color: kRed),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(respHeight * 0.02)),
                              borderSide: BorderSide(
                                  width: respHeight * 0.003, color: kGrey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(respHeight * 0.02)),
                              borderSide: BorderSide(
                                width: respHeight * 0.003,
                                color: kGrey,
                              ),
                            ),
                            // Here is key idea
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                Provider.of<LoginProvider>(context)
                                        .passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: kBlack,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                Provider.of<LoginProvider>(context,
                                        listen: false)
                                    .passwordShow();
                              },
                            ),
                          ),
                        ),
                        kContainer(xHeight: respHeight * 0.1),

                        // Sign in button
                        Container(
                          width: respHeight * 0.9,
                          height: respHeight * 0.17,
                          decoration: BoxDecoration(
                            color: kBlack,
                            borderRadius:
                                BorderRadius.circular(respHeight * 0.028),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: respHeight * 0.035,
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (Provider.of<LoginProvider>(context,
                                      listen: false)
                                  .loginFormKey
                                  .currentState!
                                  .validate()) {
                                LoginApiServices().loginApiServices(
                                    context: context,
                                    password: prvLogin.passwordController.text,
                                    mobile: prvLogin.mobileController.text);
                              }
                            },
                            child: Text(
                              'LOG IN',
                              style: GoogleFonts.anybody(color: kWhite),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Dont have an Account ?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'SIGN UP',
                                style: GoogleFonts.anybody(
                                    color: kBlack,
                                    fontSize: respHeight * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
