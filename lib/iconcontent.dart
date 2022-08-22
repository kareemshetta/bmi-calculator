import 'package:flutter/material.dart';
import 'constants.dart';

class CardContent extends StatelessWidget {
  const CardContent({Key?key ,this.iconContent,this.lapel,
  }):super(key: key);

  final  IconData? iconContent;
  final String? lapel;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          // FontAwesomeIcons.mars,
          iconContent,
          size: 80.0,
        ),
       const SizedBox(
          height: 15,
        ),
        Text(lapel as String,style:kLabelTextStyle,)
      ],
    );
  }
}