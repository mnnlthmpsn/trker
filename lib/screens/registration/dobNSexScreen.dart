import 'package:flutter/material.dart';
import 'package:trker/components/DoubleFields.dart';
import 'package:trker/screens/registration/RegisterScreen.dart';
import 'package:trker/screens/registration/locationScreen.dart';
import 'package:trker/utils/helpers.dart';

class DobNSexScreen extends StatefulWidget {
  @override
  _DobNSexScreenState createState() => _DobNSexScreenState();
}

class _DobNSexScreenState extends State<DobNSexScreen> {

  bool show = true;
  @override
  Widget build(BuildContext context) {
    return DoubleField(
      widget1: TextFormField(decoration: InputDecoration(
          suffixIcon: show ? Icon(Icons.check, color: Colors.green,) : Text(''),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: show ? Colors.green : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: show ? Colors.green : Colors.grey),
          ),
          labelText: "Gender",
          labelStyle:
          TextStyle(color: show ? Colors.green : Colors.grey),
          errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red))),),
      widget2: TextFormField(decoration: InputDecoration(
          suffixIcon: show ? Icon(Icons.check, color: Colors.green,) : Text(''),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: show ? Colors.green : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: show ? Colors.green : Colors.grey),
          ),
          labelText: "Date of Birth",
          labelStyle:
          TextStyle(color: show ? Colors.green : Colors.grey),
          errorStyle: TextStyle(color: Colors.red, fontSize: 12),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red))),),
      actionText: "Continue",
      actionIcon: Icons.arrow_forward_rounded,
      passed: this.show,
      redirectPage: LocationScreen(),
    );
  }
}
