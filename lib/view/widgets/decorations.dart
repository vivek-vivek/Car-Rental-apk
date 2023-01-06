import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_ro/colors.dart';

BoxDecoration kBoxDecoration({double respHeight = 0, Color color = kWhite}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(respHeight * 0.028),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        blurRadius: respHeight * 0.035,
      ),
    ],
  );
}

/// Decoration for TextFormfeild  in login and signup
InputDecoration kInputDecoration(respHeight, String label) {
  return InputDecoration(
    label: Text(
      label,
      style: GoogleFonts.anybody(color: kBlack),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(respHeight * 0.02)),
      borderSide: BorderSide(width: respHeight * 0.003, color: kRed),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(respHeight * 0.02)),
      borderSide: BorderSide(width: respHeight * 0.003, color: kGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(respHeight * 0.02)),
      borderSide: BorderSide(
        width: respHeight * 0.003,
        color: kGrey,
      ),
    ),
  );
}
