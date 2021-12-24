import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/helpers.dart';

class PackageDetails extends StatefulWidget {
  final id;

  const PackageDetails({Key key, @required this.id }) : super(key: key);

  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  Future _fetchItemDetails() async {
    await fetchSingleOrder(widget.id).then((res) {
      print(res);
    }).catchError((err) {
      showSnack(context, err);
    });
  }

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
      body: Padding(
        padding: EdgeInsets.only(left:20, right: 20),
        child: FutureBuilder(
          future: _fetchItemDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot);
            return Text('hey');
          },
        ),
      )
    );
  }
}
