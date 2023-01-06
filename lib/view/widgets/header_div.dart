import 'package:flutter/material.dart';
import 'package:rent_ro/colors.dart';

class HeaderDiv extends StatelessWidget {
  const HeaderDiv({
    Key? key,
    required this.respHeight,
  }) : super(key: key);

  final double respHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: respHeight * 0.35,
      child: const Divider(
        thickness: 1,
        color: kGrey,
      ),
    );
  }
}
