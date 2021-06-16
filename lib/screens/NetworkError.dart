import 'package:flutter/material.dart';
import 'package:trker/utils/constants.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.network_check_sharp,
              size: 150,
              color: Colors.grey,
            ),
            Text('Please check your Internet connection')
          ],
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(15, 0, 15, 0))),
        onPressed: () {},
        child: Text('Try Again', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
