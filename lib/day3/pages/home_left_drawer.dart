import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //影深
      elevation: 5,
      child: Container(
        color: Colors.blue.withAlpha(55)
      )
    );
  }
}