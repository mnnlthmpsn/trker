import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trker/screens/appHome/home.dart';
import 'package:trker/screens/appHome/package.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/utils/helpers.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String _title = '';

  int _currentIndex = 1;
  final List<Widget> _children = [
    Packages(),
    Home(),
    Text('Settings'),
  ];

  @override
  void initState() {
    setFirstTimeStatus();
    // TODO: implement initState
    super.initState();
  }

  setFirstTimeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
  }

  void _onTabPressed(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  void _checkCurrentPage(){
    _currentIndex == 0 ? setState(() => _title = 'Packages') : '';
    _currentIndex == 1 ? setState(() => _title = '') : '';
    _currentIndex == 2 ? setState(() => _title = 'Settings') : '';
  }

  @override
  Widget build(BuildContext context) {

    _checkCurrentPage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _currentIndex != 1 ? Colors.white : kPrimaryLightColor,
        title: Text(_title, style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(onPressed: () => showSnack(context, 'Get in Touch'), icon: Icon(Icons.qr_code_outlined))
        ],
        elevation: 0,
      ),
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 20,
        selectedItemColor: kPrimaryColor,
        onTap: _onTabPressed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Packages'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
