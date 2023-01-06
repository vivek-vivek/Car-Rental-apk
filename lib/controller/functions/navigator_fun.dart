import 'package:flutter/material.dart';

void navigatorFun(context, screenName) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screenName(),
    ),
  );
}
