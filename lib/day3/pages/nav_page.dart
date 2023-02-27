import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travels/day3/app/cons.dart';
import 'package:travels/day3/pages/home_page.dart';

class NavPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  //当前激活页
  var _position = 0;
  //页面控制器
  final _ctrl = PageController();

  @override
  void dispose() {
    //释放控制器
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        //使用pageview实现五个页面切换
        controller: _ctrl,
        children: _buildContent(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //底部栏
        items: _buildBottomItems(),
        currentIndex: _position,
        onTap: _onTapBottomItem,
      ),
    );
  }

  //主体内容页面列表
  List<Widget> _buildContent() => <Widget>[
    HomePage(),
    ActPage(),
    LovePage(),
    NotePage(),
    MePage(),
  ];

  void _onTapBottomItem(position) {
    _ctrl.jumpToPage(position);
    setState(() {
      _position = position;
    });
  }

  //生成底部导航栏item
  List<BottomNavigationBarItem> _buildBottomItems() =>
      Cons.bottomNavMap.keys
      .map((e) =>
        BottomNavigationBarItem(
          tooltip: e + "???",
          icon: Icon(Cons.bottomNavMap[e]),
          backgroundColor: Colors.blue
        )
      ).toList();


}