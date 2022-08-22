import 'constants.dart';
import 'package:flutter/material.dart';
import './components/bottombutton.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key,this.bmi,this.bodyStatus,this.detailedInfo}) : super(key: key);
final String? bmi;
final String? bodyStatus;
final String? detailedInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0E1438),
          title: const Text(
            'bmi',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                   child:const  Text(
                'your Result',
                style: kSliderTextStyle,
                textAlign: TextAlign.start,
              ),
            )),

            Expanded(
              flex: 7,
              child: Container(
                margin:const  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: kActiveReusableCardColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(bodyStatus!
                      ,
                      style:kResultTextStyle
                    ),
                    Text(
                      bmi! ,
                      style: kBmiTextStyle,
                    ),
                  Text(
                      detailedInfo!,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
           BottomButton(buttonName: 'RECALCULATE',onPressed: (){
             Navigator.pop(context);
           }),
          ],
        ));
  }
}
