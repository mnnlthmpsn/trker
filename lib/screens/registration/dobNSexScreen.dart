import 'package:flutter/material.dart';
import 'package:trker/components/DoubleFields.dart';
import 'package:trker/screens/registration/locationScreen.dart';
import 'package:trker/utils/helpers.dart';

class DobNSexScreen extends StatefulWidget {
  @override
  _DobNSexScreenState createState() => _DobNSexScreenState();
}

class _DobNSexScreenState extends State<DobNSexScreen> {
  bool show = false;
  var genderController = TextEditingController();
  var dobController = TextEditingController();
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        dismissKeyboard(context);
        if (genderController.text.isNotEmpty && dobController.text.isNotEmpty) {
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
        widget1: TextFormField(
          controller: genderController,
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
              labelText: "Gender",
              labelStyle: TextStyle(color: show ? Colors.green : Colors.grey),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
              focusedErrorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
        widget2: TextFormField(
          focusNode: focusNode,
          validator: (value) {
            if (show == false && value.isEmpty) {
              setState(() {
                show = false;
              });
              return 'This is a required field';
            } else {
              setState(() {
                show = true;
              });
            }
            return null;
          },
          controller: dobController,
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
              labelText: "Date of Birth",
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
        pageNumber: 4,
        redirectPage: LocationScreen(),
      ),
    );
  }
}
