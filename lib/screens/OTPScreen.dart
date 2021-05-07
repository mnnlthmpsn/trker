import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:trker/utils/api.dart';

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
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: PinFieldAutoFill(
      decoration: UnderlineDecoration(
        textStyle: TextStyle(fontSize: 20, color: Colors.black),
        colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
      ),
      currentCode: _code,
      codeLength: 6,
      onCodeSubmitted: (code) {},
      onCodeChanged: (code) async {
        if (code.length == 6){
          FocusScope.of(context).requestFocus(FocusNode());
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var phone =  prefs.getString('phone');
          var res = await validate(phone, code);
          print(res);
        }
      },
    ),
            )));
  }
}
