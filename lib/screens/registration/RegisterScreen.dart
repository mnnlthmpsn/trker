import 'package:flutter/material.dart';
import 'package:trker/utils/size_config.dart';

class RegisterScreen extends StatefulWidget {

  final Widget screen;

  RegisterScreen({ Key key, this.screen }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(child: widget.screen));
  }
}
