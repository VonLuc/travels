import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogAbout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: _buildTitle(),
        content: _buildContent(),
        actions: <Widget>[
          const Padding(
              padding: EdgeInsets.all(8.0), child: Text("Power By GF·J·Toly"))
        ]);
  }

  final imaPath = 'assets/images/icon_head.png';

  //构建弹框标题
  Widget _buildTitle() => Row(children: <Widget>[
        Image.asset(imaPath, width: 30, height: 30),
        SizedBox(width: 10),
        Text("关于")
      ]);

  //构建弹框内容
  _buildContent() => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlutterLogo(size: 50),
          SizedBox(height: 30),
          Text("Flutter Unit V0.0.1")
        ],
      );
}
