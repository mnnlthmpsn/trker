import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/components/KButton.dart';
import 'package:trker/utils/helpers.dart';

class TextFieldScreen extends StatefulWidget {
  final String labelText;
  final String actionText;
  final Widget redirectPage;
  final IconData actionIcon;
  final bool skipValidation;
  final int pageNumber;
  final dynamic inputType;

  TextFieldScreen(
      {Key key,
      this.labelText,
      this.pageNumber,
      this.redirectPage,
      this.actionIcon,
      this.actionText,
      this.inputType,
      this.skipValidation = false})
      : super(key: key);

  @override
  _TextFieldScreenState createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  var textController = TextEditingController();
  bool show = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode;

  @override
  void initState() {
    if (widget.skipValidation == true) {
      setState(() {
        show = true;
      });
    }
    super.initState();

    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        _storeValue();
        dismissKeyboard(context);
        if (_formKey.currentState.validate()) {
          setState(() {
            show = true;
          });
        }
      }
    });
  }

  _storeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.labelText.toLowerCase(), textController.text);
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
                  Text(
                    '${widget.pageNumber} of 7',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: TextFormField(
                        keyboardType: widget.inputType,
                        focusNode: focusNode,
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
                            suffixIcon: show
                                ? Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  )
                                : Text(''),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: show ? Colors.green : Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: show ? Colors.green : Colors.grey),
                            ),
                            labelText: widget.labelText,
                            labelStyle: TextStyle(
                                color: show ? Colors.green : Colors.grey),
                            errorStyle:
                                TextStyle(color: Colors.red, fontSize: 12),
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
              child: show
                  ? KButton(
                      redirectPage: widget.redirectPage,
                      actionIcon: widget.actionIcon,
                      actionText: widget.actionText,
                      passed: true)
                  : KButton(
                      actionIcon: widget.actionIcon,
                      actionText: widget.actionText,
                      passed: false,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
