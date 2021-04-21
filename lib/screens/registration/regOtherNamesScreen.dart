import 'package:flutter/material.dart';
import 'package:trker/components/TextFieldScreen.dart';
import 'package:trker/screens/registration/dobNSexScreen.dart';

class RegOtherNameScreen extends StatefulWidget {
  @override
  _RegOtherNameScreenState createState() => _RegOtherNameScreenState();
}

class _RegOtherNameScreenState extends State<RegOtherNameScreen> {
  @override
  Widget build(BuildContext context) {
    return TextFieldScreen(
      labelText: "Other Names",
      redirectPage: DobNSexScreen(),
      actionText: "Continue",
      actionIcon: Icons.arrow_forward_rounded,
      skipValidation: true,
    );
  }
}
