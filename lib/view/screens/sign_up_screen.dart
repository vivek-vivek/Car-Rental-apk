import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/colors.dart';
import 'package:rent_ro/controller/provider/signup_provider.dart';
import 'package:rent_ro/controller/services/signup_api_services.dart';
import 'package:rent_ro/model/signup_model.dart';
import 'package:rent_ro/view/screens/login_screen.dart';
import 'package:rent_ro/view/screens/otp_screen.dart';
import 'package:rent_ro/view/widgets/decorations.dart';
import 'package:rent_ro/view/widgets/containers.dart';
import 'package:rent_ro/view/widgets/header_div.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    // Future.delayed(
    //   Duration.zero,
    //   () => context.read<SignupProvider>().initState(),
    // );
    var prvSign = Provider.of<SignupProvider>(context);

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
                'WELCOME',
                style: GoogleFonts.abrilFatface(fontSize: respHeight * 0.07),
              ),
            ),
            kContainer(xHeight: respHeight * 0.03, xColor: kWhite),
            Form(
              key: Provider.of<SignupProvider>(context).signupFormKey,
              child: Container(
                decoration: kBoxDecoration(respHeight: respHeight),
                height: respHeight * 1.4,
                width: respHeight * 0.3,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: respHeight * 0.045,
                      vertical: respHeight * 0.03),
                  child: ListView(
                    children: [
                      kContainer(xHeight: respHeight * 0.03),
                      //Name - TextformFeild
                      Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            validator: (value) => Provider.of<SignupProvider>(
                                    context,
                                    listen: false)
                                .nameValidation(value),
                            controller: Provider.of<SignupProvider>(context)
                                .nameController,
                            cursorColor: kBlack,
                            decoration: kInputDecoration(respHeight, 'Name'),
                          ),
                          kContainer(xHeight: respHeight * 0.06),

                          // Phone Number - TextformFeild
                          TextFormField(
                              // keyboardType: TextInputType.phone,
                              validator: (value) => Provider.of<SignupProvider>(
                                      context,
                                      listen: false)
                                  .phoneNumberValidation(value),
                              controller: Provider.of<SignupProvider>(context)
                                  .phoneNumberController,
                              cursorColor: kBlack,
                              decoration:
                                  kInputDecoration(respHeight, 'Phone Number')),
                          kContainer(xHeight: respHeight * 0.06),

                          // Email Adress - TextformFeild
                          TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => Provider.of<SignupProvider>(
                                      context,
                                      listen: false)
                                  .emailValidatorFun(value!),
                              controller: Provider.of<SignupProvider>(context)
                                  .emailAdressController,
                              cursorColor: kBlack,
                              decoration:
                                  kInputDecoration(respHeight, 'Email Adress')),
                          kContainer(xHeight: respHeight * 0.06),

                          // Password Textform Field
                          TextFormField(
                            validator: (value) => Provider.of<SignupProvider>(
                                    context,
                                    listen: false)
                                .passwordValidation(value!),
                            controller: Provider.of<SignupProvider>(context)
                                .passwordController,
                            obscureText: Provider.of<SignupProvider>(
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
                                  Provider.of<SignupProvider>(context)
                                          .passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: kBlack,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  Provider.of<SignupProvider>(context,
                                          listen: false)
                                      .passwordShow();
                                },
                              ),
                            ),
                          ),
                        ],
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
                            if (Provider.of<SignupProvider>(context,
                                    listen: false)
                                .signupFormKey
                                .currentState!
                                .validate()) {
                              // SignUpApiServices().signUpApiServices(
                              //     name: prvSign.nameController.text,
                              //     mobile: prvSign.phoneNumberController.text,
                              //     email: prvSign.emailAdressController.text,
                              //     password: prvSign.passwordController.text,
                              //     context: context);
                            }
                          },
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.anybody(color: kWhite),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Alredy have an Account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: Text(
                              'LOG IN',
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
            )
          ],
        ),
      ),
    );
  }
}
