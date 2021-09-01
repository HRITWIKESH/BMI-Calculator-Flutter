import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  RoundIcon({required this.icons, required this.onpress});
  final IconData icons;
  final Function()? onpress; //we can also use voidcallback? here.
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icons),
      shape: CircleBorder(),
      fillColor: Color(0xff212747),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onpress,
    );
  }
}
