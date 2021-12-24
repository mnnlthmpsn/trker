import 'dart:async';
import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trker/screens/IntroScreen.dart';
import 'package:trker/screens/NetworkError.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/screens/registration.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/helpers.dart';

class KSplashScreen extends StatefulWidget {
  @override
  _KSplashScreenState createState() => _KSplashScreenState();
}

class _KSplashScreenState extends State<KSplashScreen> {
  dynamic screen = IntroScreen();

  @override
  void initState() {
    _setFirstTimeStatus();
    super.initState();
  }

  _setFirstTimeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('first_time') == null && await prefs.setBool('first_time', true);
  }

  // check if its first time user uses the app
  _checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // if first_time is false or null, it isn't user's first time...
    // check if user's account has expired if so or navigate to register
    prefs.getBool('first_time') == false
        ? _onBoarding()
        : await _checkForExpiry();

  }

  // on boarding
  _onBoarding() {
    setState(() {
      screen = IntroScreen();
    });
  }

  // check if account time expired
  _checkForExpiry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone');
    await validateUser(phone).then((res) {
      // if res is 0, account hasn't expired else
      // navigate to register screen but set fresh_registration flag to false
      res['status'] == 0 ? _toDashboard() : _reRegister();
    }).catchError((err) {
      print(err);
    });
  }

  void _toDashboard() {
    setState(() {
      screen = Dashboard();
    });
  }

  // re-register user (re-active account), disable phone by checking
  // fresh_registration flag
  void _reRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // check this in registration page.. if false, disable phone field
    await prefs.setBool('fresh_registration', false);
    setState(() {
      screen = Registration();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'assets/images/apple-pay.png',
      screenFunction: () async {
        await _checkStatus();
        return screen;
      },
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.leftToRight,
      backgroundColor: Colors.white,
    );
  }
}
