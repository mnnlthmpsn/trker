import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/screens/registration/RegisterScreen.dart';
import 'package:trker/screens/registration/regFirstNameScreen.dart';
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
    newPage(context, RegisterScreen(screen: RegFirstNameScreen()));
  }

  @override
  void initState() {
    // _checkStatus();
    super.initState();
  }

  _checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    !prefs.getBool('first_time') || null ? newPage(context, Dashboard()) : print('first time');
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
