import 'package:flutter/material.dart';
import 'package:trker/screens/appHome/itemDetailCard.dart';
import 'package:trker/utils/api.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/utils/helpers.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List _items = [];

  @override
  void initState() {
    _loadOrders();
    super.initState();
  }

  _loadOrders() async {
    await fetchOrders().then((res) {
      print(res);
      setState(() => _items = res['sent']);
    }).catchError((err) {
      showSnack(context, err.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.94,
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  showSnack(context, 'Received Items');
                },
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Card(
                    color: Color(0xfffcfcfc),
                    elevation: 1,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.wallet_giftcard,
                                color: Colors.green,
                              ),
                              Text(
                                'Received',
                                style: TextStyle(color: Colors.green),
                              )
                            ])),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.38,
                child: Card(
                  color: Color(0xfffcfcfc),
                  elevation: 1,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.upload_rounded, color: kPrimaryColor),
                          Text(
                            'Sent',
                            style: TextStyle(color: kPrimaryColor),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.38,
                child: Card(
                  color: Color(0xfffcfcfc),
                  elevation: 1,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.access_alarm_outlined, color: Colors.grey),
                          Text(
                            'Pending',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              key: _listKey,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ItemDetailCard(name: _items[index]['package_desc'], color: Colors.green,);
              }),
        ),
      ],
    );
  }
}
