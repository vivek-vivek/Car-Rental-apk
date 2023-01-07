import 'package:flutter/material.dart';
import 'package:rent_ro/view/widgets/colors.dart';

SnackBar snakBarFunction(
    {String content = 'enter a message',
    int duration = 3,
    Color color = kBlack}) {
  return SnackBar(
    backgroundColor: color,
    content: Text(content),
    duration: Duration(seconds: duration),
  );
}
