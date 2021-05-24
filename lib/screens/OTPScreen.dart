import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/utils/helpers.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String _code = "";

  @override
  void initState() {
    _listenForchange();
    super.initState();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  _listenForchange() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text('OTP', style: TextStyle(color: Colors.white),),
          elevation: 0,
        ),
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              colorFilter: new ColorFilter.mode(
                  Colors.white.withOpacity(0.3), BlendMode.dstATop),
              fit: BoxFit.cover)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle: TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              currentCode: _code,
              codeLength: 6,
              onCodeSubmitted: (code) {},
              onCodeChanged: (code) async {
                if (code.length == 6) {
                  // FocusScope.of(context).requestFocus(FocusNode());
                  // SharedPreferences prefs = await SharedPreferences.getInstance();
                  // var phone = prefs.getString('phone');
                  // var res = await validate(phone, code);
                  // print(res);
                  newPageDestroyPrevious(context, Dashboard());
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text('Enter OTP', textAlign: TextAlign.center,),
            )
          ],
        ),
      )),
    ));
  }
}
