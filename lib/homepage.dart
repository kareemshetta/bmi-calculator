import 'calculator_brain.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/reusablecard.dart';
import 'iconcontent.dart';
import 'constants.dart';
import './components/roundediconbutton.dart';
import './components/bottombutton.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColor = kInactiveReusableCardColor;
  Color femaleCardColor = kInactiveReusableCardColor;

  void changeCardColor(Gender gender) {
    setState(() {
      if (gender == Gender.male) {
        if (maleCardColor == kInactiveReusableCardColor) {
          maleCardColor = kActiveReusableCardColor;
          if (femaleCardColor == kActiveReusableCardColor) {
            femaleCardColor = kInactiveReusableCardColor;
          }
        }
      } else {
        if (femaleCardColor == kInactiveReusableCardColor) {
          femaleCardColor = kActiveReusableCardColor;
          if (maleCardColor == kActiveReusableCardColor) {
            maleCardColor = kInactiveReusableCardColor;
          }
        }
      }
    });
  }

  // bool isMaleCardSelected = false;
  // bool isFemaleCardSelected = false;
  Gender? selectedGender;
  double height = 180;
  int weight = 6;
  int age = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0E1438),
        title:const Text('BMI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    getPressed: () {
                      setState(() {
                        //
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: const CardContent(
                        iconContent: FontAwesomeIcons.mars, lapel: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    getPressed: () {
                      setState(() {
                        //
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild:const  CardContent(
                        iconContent: FontAwesomeIcons.venus, lapel: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveReusableCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               const    Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.round().toString(),
                        style: kSliderTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // we customise slider them by coping it
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFeb1555),
                        overlayColor:const  Color(0x29eb1555),
                        activeTrackColor: Colors.white,
                        thumbShape:const  RoundSliderThumbShape(
                          enabledThumbRadius: 15.0,
                        ),
                        overlayShape:
                           const  RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height,
                      min: 120.0,
                      max: 220.0,
                      // active color will change both thumb and track
                      // activeColor: Colors.white,
                      inactiveColor:const  Color(0xFF8D8E98),

                      onChanged: (double? newValue) {
                        setState(() {
                          // newValue! it's mean that treat non nullable as nullable it's called assertion operator
                          height = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveReusableCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kSliderTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                             const  SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveReusableCardColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const  Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kSliderTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                             const  SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonName: 'CALCULATE',
            onPressed: () {
              CalculatorBrain calBrain =
                  CalculatorBrain(height.toInt(), weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: calBrain.calculateBmi(),
                    bodyStatus: calBrain.getResult(),
                    detailedInfo: calBrain.getDetailedInfo(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
