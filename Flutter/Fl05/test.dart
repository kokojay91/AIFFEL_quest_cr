import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Heart Icon Example'),
        ),
        body: Center(
          child: IconButton(
            icon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.red,
            ),
            iconSize: 50,
            onPressed: () {
              print('Heart icon clicked!');
            },
          ),
        ),
      ),
    );
  }
}
