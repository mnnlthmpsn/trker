import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trker/components/TextFieldScreen.dart';
import 'package:trker/screens/registration/regLastNameScreen.dart';
import 'package:trker/utils/helpers.dart';

class RegFirstNameScreen extends StatefulWidget {
  @override
  _RegFirstNameScreenState createState() => _RegFirstNameScreenState();
}

class _RegFirstNameScreenState extends State<RegFirstNameScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: TextFieldScreen(
        inputType: TextInputType.name,
          labelText: "Firstname",
          pageNumber: 1,
          redirectPage: RegLastNameScreen(),
          actionText: "Continue",
          actionIcon: Icons.arrow_forward_rounded),
    );
  }
}
