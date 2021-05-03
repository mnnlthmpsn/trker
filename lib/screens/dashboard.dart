import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  void initState() {
    _setFirst_time_status();
    // TODO: implement initState
    super.initState();
  }

  _setFirst_time_status() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Welcome to your Dashboard'),
      ),
    );
  }
}
