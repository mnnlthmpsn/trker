import 'dart:io';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/screens/registration.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/utils/helpers.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool status;

  // when onboarding ends
  void _onIntroEnd(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
    newPageDestroyPrevious(context, Registration());
  }

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  // check if its first time user uses the app
  _checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // if first_time is false or null, it isn't user's first time...
    // check if user's account has expired if so or navigate to register
    !prefs.getBool('first_time') || null
        ? await _checkForExpiry()
        : print('Continue with onboarding');
  }

  // check if account time expired
  _checkForExpiry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.getString('phone');
    try {
      await validateUser(phone).then((res) {
        // if res is 0, account hasn't expired else
        // navigate to register screen but set fresh_registration flag to false
        res['status'] == 0 ? _toDashboard() : _reRegister();
      }).catchError((err) {
        print(err);
      });
    } on SocketException catch (_) {
      showSnack(context, 'Network error');
    }
  }

  void _toDashboard() {
    newPageDestroyPrevious(context, Dashboard());
  }

  // re-register user (re-active account), disable phone by checking
  // fresh_registration flag
  void _reRegister() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // check this in registration page.. if false, disable phone field
    await prefs.setBool('fresh_registration', false);
    newPageDestroyPrevious(context, Registration());
  }

  void _freshRegistration() {
    newPageDestroyPrevious(context, Registration());
  }

  static const pageDecoration = const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 15.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context) {
    dismissKeyboard(context);
    return IntroductionScreen(
      key: introKey,

      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Real Time Tracking",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/images/splash_1.png', width: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Get Notified",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/images/splash_2.png', width: 200),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Easy to use",
          body:
              "Instead of having to buy an entire share, invest any amount you want.",
          image: Image.asset('assets/images/splash_3.png', width: 200),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      skipColor: kPrimaryColor,
      doneColor: kPrimaryColor,
      next: const Icon(
        Icons.arrow_forward,
        color: kPrimaryColor,
      ),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: kPrimaryColor,
        activeColor: kPrimaryColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
