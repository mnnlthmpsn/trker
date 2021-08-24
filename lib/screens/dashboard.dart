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

  Widget _title;

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
    _currentIndex == 0 ? setState(() => _title = Text('Packages', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black))) : '';
    _currentIndex == 1 ? setState(() => _title = Text('Paypack', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14))) : '';
    _currentIndex == 2 ? setState(() => _title = Text('Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black))) : '';
  }

  @override
  Widget build(BuildContext context) {

    _checkCurrentPage();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _currentIndex != 1 ? Colors.white : kPrimaryColor,
        title: _title,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(onPressed: () => showSnack(context, 'Get in Touch'), icon: Icon(Icons.qr_code_outlined, color: _currentIndex != 1 ? Colors.black : Colors.white,))
        ],
        elevation: 0,
      ),
      body: SafeArea(child: _children[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        elevation: 20,
        enableFeedback: true,
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
