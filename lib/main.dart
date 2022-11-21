import 'package:bmi_calculator/Calc.dart';
import 'package:bmi_calculator/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/' : (context) => HomeScreen(),
            'calc' : (context) => Calc(),
          },
        )
      );
}