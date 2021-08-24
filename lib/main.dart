import 'package:flutter/material.dart';
import 'package:trker/screens/Splash.dart';
import 'package:trker/utils/constants.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Poppins",
      accentColor: Colors.white,
      primaryColor: kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: KSplashScreen(),
  ));
}
