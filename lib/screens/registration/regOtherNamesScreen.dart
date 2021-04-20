import 'package:flutter/material.dart';
import 'package:trker/components/KTextField.dart';
import 'package:trker/screens/registration/regLastNameScreen.dart';

class RegOtherNameScreen extends StatefulWidget {
  @override
  _RegOtherNameScreenState createState() => _RegOtherNameScreenState();
}

class _RegOtherNameScreenState extends State<RegOtherNameScreen> {
  @override
  Widget build(BuildContext context) {
    return KTextField(
      labelText: "Other Names",
      redirectPage: RegLastNameScreen(),
      actionText: "Continue",
      actionIcon: Icons.arrow_forward_rounded,
      skipValidation: true,
    );
  }
}
