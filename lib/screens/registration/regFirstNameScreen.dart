import 'package:flutter/material.dart';
import 'package:trker/components/TextFieldScreen.dart';
import 'package:trker/screens/registration/RegisterScreen.dart';
import 'file:///C:/Users/Jojo/AndroidStudioProjects/trker/lib/screens/registration/regLastNameScreen.dart';
import 'package:trker/utils/helpers.dart';

class RegFirstNameScreen extends StatefulWidget {
  @override
  _RegFirstNameScreenState createState() => _RegFirstNameScreenState();
}

class _RegFirstNameScreenState extends State<RegFirstNameScreen> {
  @override
  Widget build(BuildContext context) {
    return TextFieldScreen(
        labelText: "Firstname",
        redirectPage: RegLastNameScreen(),
        actionText: "Continue",
        actionIcon: Icons.arrow_forward_rounded);
  }
}
