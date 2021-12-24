import 'package:flutter/material.dart';
import 'package:trker/screens/appHome/packageDetails.dart';
import 'package:trker/utils/constants.dart';
import 'package:trker/utils/helpers.dart';

class ItemDetailCard extends StatelessWidget {
  final title;
  final subtitle;
  final header;
  final id;

  const ItemDetailCard({this.title, this.subtitle, this.header, this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0xfff3f3f3),
              spreadRadius: 10,
              blurRadius: 20
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => newPage(context, PackageDetails(id: id)),
              child: ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      header == 'sent' ? Icons.upload_rounded : Icons.download_rounded,
                      color: header == 'sent' ? kPrimaryColor : kSecondaryColor,
                    ),
                  ],
                ),
                title: Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                subtitle: Text(subtitle, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
