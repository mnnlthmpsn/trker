import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trker/components/TextFieldScreen.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/utils/helpers.dart';

class PhoneScreen extends StatefulWidget {
  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: TextFieldScreen(
          inputType: TextInputType.phone,
          labelText: 'Phone',
          pageNumber: 1,
          redirectPage: Dashboard(),
          actionText: "Finish",
          actionIcon: Icons.arrow_forward_rounded),
    );
  }
}
