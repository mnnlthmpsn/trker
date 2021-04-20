import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//navigating to a new Screen
void newPage(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void dismissKeyboard(context){
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}