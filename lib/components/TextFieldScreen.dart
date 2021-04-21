import 'package:flutter/material.dart';
import 'package:trker/components/KButton.dart';
import 'package:trker/screens/registration/RegisterScreen.dart';
import 'package:trker/utils/helpers.dart';
import 'package:trker/utils/size_config.dart';

class TextFieldScreen extends StatefulWidget {

  final String labelText;
  final String actionText;
  final Widget redirectPage;
  final IconData actionIcon;
  final bool skipValidation;

  TextFieldScreen({Key key, this.labelText, this.redirectPage, this.actionIcon, this.actionText, this.skipValidation = false}) : super(key: key);

  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  var textController = TextEditingController();
  bool show = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.skipValidation == true){
      setState(() {
        show = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("1 of 7"),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: TextFormField(
                        onEditingComplete: () {
                          dismissKeyboard(context);
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              show = true;
                            });
                          }
                        },
                        validator: (value) {
                          if (show == false && value.isEmpty) {
                            return 'This is a required field. Enter ${widget.labelText}';
                          }
                          return null;
                        },
                        controller: textController,
                        autofocus: false,
                        cursorColor: Colors.grey,
                        cursorWidth: .5,
                        decoration: InputDecoration(
                            suffixIcon: show ? Icon(Icons.check, color: Colors.green,) : Text(''),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: show ? Colors.green : Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: show ? Colors.green : Colors.grey),
                            ),
                            labelText: widget.labelText,
                            labelStyle:
                            TextStyle(color: show ? Colors.green : Colors.grey),
                            errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: show ? KButton(redirectPage: widget.redirectPage, actionIcon: widget.actionIcon, actionText: widget.actionText, passed: true) : KButton(actionIcon: widget.actionIcon, actionText: widget.actionText, passed: false,),
            ),
          ],
        ),
      ),
    );
  }
}
