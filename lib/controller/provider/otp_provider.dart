import 'package:flutter/cupertino.dart';

class OtpProvider with ChangeNotifier {
  final otpController1 = TextEditingController();
  final otpController2 = TextEditingController();
  final otpController3 = TextEditingController();
  final otpController4 = TextEditingController();

  /// Globel keys
  final otpFormKey = GlobalKey<FormState>();
}
