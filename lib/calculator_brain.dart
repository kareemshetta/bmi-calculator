import 'dart:math';
class CalculatorBrain{

  final int? height;
  final int? weight;


  CalculatorBrain(this.height,this.weight);
   late double _bmi;
  String calculateBmi(){

      _bmi=weight! / pow(height!/100, 2);
     return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>25){
      return 'overweight';
    }else if(_bmi>18.5&&_bmi<25){
      return 'normal';
    }else{
      return 'underweight';
    }

  }
String getDetailedInfo()
{
  if(_bmi>25){
    return 'you have to loose some weight,you must do some exercises';
  }else if(_bmi>18.5&&_bmi<25){
    return 'great jop , you\'re doing great work';
  }else{
    return 'you\'re underweight, you have to  eat  more';
  }

}

}