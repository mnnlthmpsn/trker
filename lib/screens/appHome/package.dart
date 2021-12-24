import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trker/screens/NetworkError.dart';
import 'package:trker/screens/appHome/itemDetailCard.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/utils/helpers.dart';

class Packages extends StatefulWidget {
  const Packages({Key key}) : super(key: key);

  @override
  _PackagesState createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List _sentItems = [];
  List _receivedItems = [];
  bool _isLoading = true;

  String active = 'sent';

  @override
  void initState() {
    _loadOrders();
    super.initState();
  }

  _loadOrders() async {
    await fetchOrders().then((res) {
      print(res);
      setState(() => {
        _sentItems = res['sent'],
        _receivedItems = res['got'] == 'empty' ? [] : res['got'],
        _isLoading = false});
    }).catchError((err) {
      err == '001' ? newPage(context, NetworkError()) : showSnack(context, err);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: SpinKitRipple(
          color: kPrimaryColor,
          size: 70,
        ),
      );
    } else {
      return ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                // sent
                child: InkWell(
                  onTap: () => setState(() => active = 'sent'),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.upload_rounded,
                          color: kPrimaryColor,
                        ),
                        Text('Sent', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xfff3f3f3),
                              spreadRadius: 10,
                              blurRadius: 20)
                        ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                // received
                child: InkWell(
                  onTap: () => setState(() => active = 'received'),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.download_rounded,
                          color: kSecondaryColor,
                        ),
                        Text('Received', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xfff3f3f3),
                              spreadRadius: 10,
                              blurRadius: 20)
                        ]),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: active == 'sent' ? _sentItems.length : _receivedItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ItemDetailCard(
                    header: active,
                    id: active == 'sent' ? _sentItems[index]['txn_id'] : _receivedItems[index]['txn_id'],
                    title: active == 'sent' ? _sentItems[index]['package_desc'] : _receivedItems[index]['package_desc'],
                    subtitle: active == 'sent' ? _sentItems[index]['comment'] : _receivedItems[index]['comment'],
                  ),
                );
              })
        ],
      );
    }
  }
}
