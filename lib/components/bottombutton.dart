import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';



class BottomButton extends StatelessWidget {
  const BottomButton({this.buttonName, Key? key, required this.onPressed})
      : super(key: key);

  final String? buttonName;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin:const EdgeInsets.only(top: 5),
        padding:const  EdgeInsets.only(bottom: 5),
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Text(
          buttonName!,
          style: kBottomTextStyle,
          textAlign: TextAlign.center,
        ),

      ),
    );
  }
}
