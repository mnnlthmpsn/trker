import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/components/DoubleFields.dart';
import 'package:trker/screens/registration/idScreen.dart';
import 'package:trker/utils/helpers.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  bool show = false;
  var emailController = TextEditingController();
  var postController = TextEditingController();
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _storeValue();
        dismissKeyboard(context);
        if (emailController.text.isNotEmpty &&
            postController.text.isNotEmpty) {
          setState(() {
            show = true;
          });
        }
      }
    });
  }

  _storeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('post_code', postController.text);
    await prefs.setString('email', emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismissKeyboard(context),
      child: DoubleField(
        widget1: TextFormField(
          keyboardType: TextInputType.number,
          controller: postController,
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
        widget2: TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: focusNode,
          controller: emailController,
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
              labelText: "Email",
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
        pageNumber: 6,
        redirectPage: IDScreen(),
      ),
    );
  }
}
