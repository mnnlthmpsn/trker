import 'package:flutter/material.dart';
import 'package:trker/components/DoubleFields.dart';
import 'package:trker/components/KDropdownField.dart';
import 'package:trker/screens/registration/contactScreen.dart';
import 'package:trker/utils/helpers.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool show = false;
  var regionController = TextEditingController();
  var postcodeController = TextEditingController();
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        dismissKeyboard(context);
        if (
            postcodeController.text.isNotEmpty) {
          setState(() {
            show = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: DoubleField(
        widget1: KDropdownField(textLabel: 'Regions', items: ['Accra', 'Central', 'North1', 'North2', 'North3', 'North4', 'North5', 'North6', 'North7','North8', 'North9'],),
        widget2: TextFormField(
          focusNode: focusNode,
          controller: postcodeController,
          decoration: InputDecoration(
              suffixIcon: show
                  ? Icon(
                      Icons.check,
                      color: Colors.green,
                    )
                  : Text(''),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: show ? Colors.green : Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: show ? Colors.green : Colors.grey),
              ),
              labelText: "Post Code",
              labelStyle: TextStyle(color: show ? Colors.green : Colors.grey),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
              focusedErrorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
        actionText: "Continue",
        actionIcon: Icons.arrow_forward_rounded,
        passed: this.show,
        pageNumber: 5,
        redirectPage: ContactScreen(),
      ),
    );
  }
}
