import 'package:flutter/material.dart';
import 'package:trker/components/TextFieldScreen.dart';
import 'package:trker/screens/registration/regOtherNamesScreen.dart';

class RegLastNameScreen extends StatefulWidget {
  @override
  _RegLastNameScreenState createState() => _RegLastNameScreenState();
}

class _RegLastNameScreenState extends State<RegLastNameScreen> {
  @override
  Widget build(BuildContext context) {
    return TextFieldScreen(
        labelText: "Lastname",
        redirectPage: RegOtherNameScreen(),
        actionText: "Continue",
        actionIcon: Icons.arrow_forward_rounded);
  }
}
