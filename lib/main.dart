import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screen/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff10163B),
        //accentColor: Colors.purple,
        scaffoldBackgroundColor: Color(0xff0C1234),
        // textTheme: TextTheme(
        //   bodyText2: TextStyle(color: Colors.white),
        // ),
      ),
      home: InputPage(),
    );
  }
}
