import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travels/day6/fps_show.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: FpsShow()),
      ),
    );
  }
}