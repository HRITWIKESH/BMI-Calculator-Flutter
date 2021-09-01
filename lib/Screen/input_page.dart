import 'package:bmi_calculator/Screen/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/icon_class.dart';
import '../Components/constant.dart';
import 'result.dart';
import '../Components/roundicon.dart';
import '../Components/Bottombutton.dart';
import '../Components/caculator-brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectgender;
  int height = 180;
  int weight = 60;
  int age = 19;

  // Color malecolor = inactivecolor;
  // Color femalecolor = inactivecolor;
  // void updateColor(Gender sgender) {
  //   if (sgender == Gender.male && malecolor == inactivecolor) {
  //     malecolor = reusablecardcolor;
  //     femalecolor = inactivecolor;
  //   } else {
  //     malecolor = inactivecolor;
  //   }
  //   if (sgender == Gender.female && femalecolor == inactivecolor) {
  //     femalecolor = reusablecardcolor;
  //     malecolor = inactivecolor;
  //   } else {
  //     femalecolor = inactivecolor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onpressed: () {
                        setState(() {
                          selectgender = Gender.male;
                        });
                      },

                      //colour: malecolor,
                      colour: selectgender == Gender.male
                          ? kReusablecardcolor
                          : kInactivecolor,
                      cardchild: Iconclass(
                        icons: FontAwesomeIcons.mars,
                        label: 'MALE',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    onpressed: () {
                      setState(() {
                        selectgender = Gender.female;
                      });
                    },
                    //colour: femalecolor,
                    colour: selectgender == Gender.female
                        ? kReusablecardcolor
                        : kInactivecolor,
                    cardchild: Iconclass(
                      icons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kReusablecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabeltext,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kLabeltext1,
                      ),
                      Text(
                        'cm',
                        style: kLabeltext,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff6A7088),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffFE0167),
                        overlayColor: Color(0xff461844),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kReusablecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabeltext,
                        ),
                        Text(
                          weight.toString(),
                          style: kLabeltext1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icons: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIcon(
                              icons: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kReusablecardcolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabeltext,
                        ),
                        Text(
                          age.toString(),
                          style: kLabeltext1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIcon(
                              icons: FontAwesomeIcons.minus,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIcon(
                              icons: FontAwesomeIcons.plus,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            ontap: () {
              Calculate calc = Calculate(
                height: height,
                weight: weight,
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPages(
                  bmiresult: calc.getResult(),
                  bmicalc: calc.calBmi(),
                  bmiadvice: calc.advice(),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}
