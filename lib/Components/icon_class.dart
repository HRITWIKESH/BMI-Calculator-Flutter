import 'package:flutter/material.dart';
import 'constant.dart';

class Iconclass extends StatelessWidget {
  Iconclass({required this.icons, required this.label});
  final IconData icons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabeltext,
        ),
      ],
    );
  }
}
