import 'package:flutter/material.dart';
import 'package:trker/components/KButton.dart';
import 'package:trker/utils/size_config.dart';

class DoubleField extends StatefulWidget {
  final String labelText;
  final Widget widget1;
  final Widget widget2;
  final String actionText;
  final Widget redirectPage;
  final IconData actionIcon;
  final Function buttonPress;
  final bool passed;

  DoubleField(
      {Key key,
      this.labelText,
      this.widget1,
      this.widget2,
      this.actionText,
      this.buttonPress,
      this.passed,
      this.redirectPage,
      this.actionIcon})
      : super(key: key);

  @override
  _DoubleFieldState createState() => _DoubleFieldState();
}

class _DoubleFieldState extends State<DoubleField> {
  bool show = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("10 of 20"),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                      child: Row(
                        children: [
                          SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 45,
                              child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                  child: widget.widget1)),
                          SizedBox(
                              width: SizeConfig.blockSizeHorizontal * 45,
                              child: widget.widget2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: KButton(
              passed: widget.passed,
              actionText: widget.actionText,
              actionIcon: widget.actionIcon,
              redirectPage: widget.redirectPage,
            )),
          ],
        ),
      ),
    );
  }
}
