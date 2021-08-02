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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Image(image: AssetImage('assets/images/logi.png')),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 80),
                      child: SizedBox(
                        height: 60,
                        child: TextField(
                          cursorColor: kPrimaryColor,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: 'Enter Tracking ID',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: kPrimaryColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                                borderSide: BorderSide(color: kPrimaryColor)),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('History', style: TextStyle(color: kTextColor, fontSize: 14, fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Text('No History Available', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),)
        ],
      ),
    );
  }
}
