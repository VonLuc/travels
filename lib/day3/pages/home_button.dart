import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      FloatingActionButton(
        onPressed: () => _onPressed(context),
        child: Icon(Icons.add),
      );

  _onPressed(BuildContext context) {
    showSnackBar(context);
  }

  showSnackBar(BuildContext context) {
    var snackBar = SnackBar(
      //颜色
      backgroundColor: Color(0xffFB6431),
      //内容
      content: Text('Hello'),
      //持续时间
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: '确定',
        onPressed: () {
          showModalBottom(context);
          print("Flutter Unit");
        }
      )
    );
    //弹出snackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showModalBottom(BuildContext context) {
    var content = Container(
      color: Color(0xdde4f6f6),
      height: 60,
      child: Center(
        child: Image.asset("asset/images/icon_flutter.png", width: 50)
      )
    );
    showModalBottomSheet(context: context, builder: (context) => content)
    .then((val) {
      print("Closed");
      showBottomSheet(context);
    });
  }

  showBottomSheet(BuildContext context) {
    var content = Container(
      color: Color(0xdde3fbf6),
      height: 100,
      alignment: Alignment.center,
      child: Image.asset("asset/images/icon_flutter.png", width: 50),
    );
    //弹出bottomSheet
    Scaffold.of(context).showBottomSheet((context) => content);
  }
}
