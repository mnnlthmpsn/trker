import 'package:flutter/material.dart';

class ItemDetailCard extends StatelessWidget {
  final name;
  final color;

  const ItemDetailCard({this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.92,
          height: 120,
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(name),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: color, width: 0.4)
            ),
          ),
        ),
      ],
    );
  }
}
