import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic data = {'Firstname': 'Emmanuel', 'Lastname': 'Thompson', 'Age': 23};

  var keys = [];
  var values = [];

  @override
  void initState() {
    super.initState();
    _convertToArray();
  }

  _convertToArray() {
    data.forEach((key, value) {
      keys.add(key);
      values.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: keys.map((key) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(key.toString()),
            )).toList(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: values.map((val) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(val.toString()),
            )).toList(),
          )
        ],
      )
    );
  }
}
