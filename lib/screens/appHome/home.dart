import 'package:flutter/cupertino.dart';
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
        children: [
          Stack(
            children: <Widget>[
              Container(color: Colors.white),
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .55,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(80))),
                  )),
              Align(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80, bottom: 20),
                      child: Text(
                        'Tracking Your Shipment',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Please enter your tracking number',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * .85,
                      height: MediaQuery.of(context).size.height * .07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .7,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter tracking number',
                                hintStyle: TextStyle(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                                prefixIcon: Icon(Icons.local_shipping,
                                    color: kSecondaryColor),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onTap: () {
                                dismissKeyboard(context);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 120,
                          height: 120,
                          child:
                              Image.asset('assets/images/delivery-man.png'))))
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 26, 10, 18),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('History',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700])),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('View All',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryColor)),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: kSecondaryColor,
                          size: 14,
                        )
                      ],
                    )
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.width * .3,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  child: new Material(
                    child: InkWell(
                      onTap: () {},
                      child: new Container(
                        width: 100.0,
                        height: 100.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.download_rounded, color: Colors.white),
                            Text(
                              'PS 5',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '24th July, 2021',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  child: new Material(
                    child: new InkWell(
                      onTap: () {},
                      child: new Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_rounded, color: Colors.white),
                            Text(
                              'Certificate',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '24th July, 2021',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Container(
                  child: new Material(
                    child: new InkWell(
                      onTap: () {},
                      child: new Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.upload_rounded, color: Colors.white),
                            Text(
                              'Nike Sportswear',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '24th July, 2021',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    color: Colors.transparent,
                  ),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * .5,
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(.9),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
