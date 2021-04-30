import 'package:flutter/material.dart';
import 'package:trker/components/DoubleFields.dart';
import 'package:trker/screens/dashboard.dart';
import 'package:trker/utils/helpers.dart';

class IDScreen extends StatefulWidget {
  @override
  _IDScreenState createState() => _IDScreenState();
}

class _IDScreenState extends State<IDScreen> {
  bool show = false;
  var typeController = TextEditingController();
  var numberController = TextEditingController();
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        dismissKeyboard(context);
        if (typeController.text.isNotEmpty &&
            numberController.text.isNotEmpty) {
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
          controller: typeController,
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
              labelText: "ID Type",
              labelStyle: TextStyle(color: show ? Colors.green : Colors.grey),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
              focusedErrorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
        widget2: TextFormField(
          focusNode: focusNode,
          controller: numberController,
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
              labelText: "ID Number",
              labelStyle: TextStyle(color: show ? Colors.green : Colors.grey),
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
              focusedErrorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
        actionText: "Finish",
        actionIcon: Icons.done,
        passed: this.show,
        pageNumber: 7,
        redirectPage: Dashboard(),
      ),
    );
  }
}
