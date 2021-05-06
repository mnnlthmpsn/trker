import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  var districtController = TextEditingController();
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        dismissKeyboard(context);
        _storeValue();
        if (
            districtController.text.isNotEmpty) {
          setState(() {
            show = true;
          });
        }
      }
    });
  }

  _storeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('district', districtController.text);
  }

  var _regions = [
    { 'key': 'Accra', 'value': 'Greater Accra'},
    { 'key': 'Brong Ahafo', 'value': 'Brong Ahafo'},
    { 'key': 'Central', 'value': 'Central Region'},
    { 'key': 'Easter', 'value': 'Eastern Region'},
    { 'key': 'Volta', 'value': 'Volta Region'}
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: DoubleField(
        widget1: KDropdownField(textLabel: 'Regions', items: _regions,),
        widget2: TextFormField(
          focusNode: focusNode,
          controller: districtController,
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
              labelText: "District",
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
