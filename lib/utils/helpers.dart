import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//navigating to a new Screen
void newPage(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void newPageDestroyPrevious(context, screen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

void dismissKeyboard(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

dynamic storeInLocalStorage(key, val, type) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  switch (type) {
    case 'int':
      {
        await prefs.setInt(key, val);
      }
      break;
    case 'str':
      {
        var temp_val;

        // do not trim other names ('could be two names')

        key == 'other_names' ? temp_val = val : temp_val = val.trim();
        await prefs.setString(key, temp_val);
      }
      break;
    case 'bool':
      {
        await prefs.setBool(key, val);
      }
      break;
  }
}

void showSnack(context, msg) {
  final snackBar = SnackBar(
    content: Text(
      msg.toString(),
      style: TextStyle(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
