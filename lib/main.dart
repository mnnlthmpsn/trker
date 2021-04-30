import 'package:flutter/material.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/screens/introScreen.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      accentColor: Colors.white,
      primaryColor: kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: IntroScreen(),
  ));
}
