import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KDropdownField extends StatefulWidget {
  final List<String> items;
  final String textLabel;

  KDropdownField({Key key, @required this.items, this.textLabel})
      : super(key: key);

  @override
  _KDropdownFieldState createState() => _KDropdownFieldState();
}

class _KDropdownFieldState extends State<KDropdownField> {
  String _chosenValue;
  bool show = false;

  _setSharedPreference(val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.textLabel.toLowerCase(), val);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: show ? Colors.green : Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: show ? Colors.green : Colors.grey),
                ),
                labelText: widget.textLabel,
                labelStyle: TextStyle(color: show ? Colors.green : Colors.grey),
                errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                focusedErrorBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red))),
            value: _chosenValue,
            items: widget.items.map<DropdownMenuItem>((value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            // hint: Text(widget.textLabel),
            onChanged: (value) {
              _setSharedPreference(value);
              setState(() {
                _chosenValue = value;
                show = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
