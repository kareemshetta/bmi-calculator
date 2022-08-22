import 'package:bmicalculator/result_page.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bmi ',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff0E1438),

         colorScheme:const ColorScheme.dark(
             //primarySwatch: Colors.indigo
           primary:  Color(0xFF0A0E21),
        // places where we can choose primary and accent colors
          ),

          textTheme: const TextTheme(
            bodyText2:  TextStyle(
            color: Colors.white,
          )
          ),
     // primaryColor: const Color(0xFF0A0E21)
      ),
     // color:Color(0xFF0A0E21) ,
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {'/':(context)=>const MyHomePage(title: 'Flutter Demo Home Page'),
        '/resultPage':(context)=>const ResultPage()},
    );
  }
}

