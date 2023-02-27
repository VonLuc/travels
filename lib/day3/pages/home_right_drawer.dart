import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      child: Container(
        color: Colors.cyanAccent.withAlpha(55)
      )
    );
  }
}