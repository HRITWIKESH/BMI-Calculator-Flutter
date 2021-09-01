import 'package:bmi_calculator/Components/Bottombutton.dart';
import 'package:bmi_calculator/Components/constant.dart';
import 'package:bmi_calculator/Components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/reusable_card.dart';

class ResultPages extends StatelessWidget {
  ResultPages(
      {required this.bmicalc,
      required this.bmiresult,
      required this.bmiadvice});
  final String bmicalc;
  final String bmiresult;
  final String bmiadvice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kResulttext,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kReusablecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiresult,
                    style: kNormaltext,
                  ),
                  Text(
                    bmicalc,
                    style: kBmino,
                  ),
                  Text(
                    bmiadvice,
                    style: kBmis,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
