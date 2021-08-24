import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trker/utils/constants.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key key}) : super(key: key);

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: Text('Body')
    );
  }
}
