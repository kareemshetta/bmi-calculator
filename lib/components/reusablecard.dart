import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
    final Function()? getPressed;
 const  ReusableCard({Key?key,required this.colour, this.cardChild, this.getPressed}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:getPressed  ,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}


