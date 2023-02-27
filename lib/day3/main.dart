import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travels/day3/pages/nav_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavPage()
    );
  }
}