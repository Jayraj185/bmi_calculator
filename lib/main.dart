import 'package:bmi_calculator/screens/HomeScreen/provider/HomeProvider.dart';
import 'package:bmi_calculator/screens/HomeScreen/view/HomePage.dart';
import 'package:bmi_calculator/utils/SplashPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    runApp(
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => SplashPage(),
              'Home' : (context) => HomeScreen(),
            },
          ),
        )
      );
}