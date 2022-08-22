import 'package:flutter/material.dart';


class RoundedIconButton extends StatelessWidget {
 const  RoundedIconButton({Key?key,this.iconData, this.onPressed}):super(key: key);
  final IconData? iconData;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // for making our desired button  it's the source of each flutter button
    return RawMaterialButton(
      onPressed: onPressed,
      // FOR CHOOSING BUTTON SHAPE
      //CircleBorder()
      //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
      shape: const CircleBorder(),
      elevation: 0.0,
      // for determine  height and width for button
      constraints:const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      // the color of the button
      fillColor:const  Color(0xFF4C4F5E),
      // child of the widget
      child: Icon(iconData),
    );
  }
}
