import 'package:flutter/material.dart';
import 'package:trker/components/TextFieldScreen.dart';
import 'package:trker/screens/registration/dobNSexScreen.dart';
import 'package:trker/utils/helpers.dart';

class RegOtherNameScreen extends StatefulWidget {
  @override
  _RegOtherNameScreenState createState() => _RegOtherNameScreenState();
}

class _RegOtherNameScreenState extends State<RegOtherNameScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: TextFieldScreen(
        labelText: "Other Names",
        inputType: TextInputType.name,
        pageNumber: 3,
        redirectPage: DobNSexScreen(),
        actionText: "Continue",
        actionIcon: Icons.arrow_forward_rounded,
        skipValidation: true,
      ),
    );
  }
}
