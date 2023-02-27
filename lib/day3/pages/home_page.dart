import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travels/day3/app/cons.dart';
import 'package:travels/day3/pages/home_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        //标签控制器
        length: Cons.homeTabs.length,//标签个数
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text("Flutter 联盟"),
            //标题栏右侧按钮
            actions: <Widget>[Icon((Icons.search)), HomeMenu()],
            bottom: _buildHomeTabBar()),
          body: Align(
            alignment: Alignment(0, -0.8),
            child: Text("展示集")),
          //左滑页
          drawer: HomeLeftDrawer(),
          //右滑页
          endDrawer: HomeRightDrawer(),
          floatingActionButton: HomeButton()));
  }

  //构建标签页
  PreferredSizeWidget _buildHomeTabBar() => TabBar(
    //字号
    labelStyle: TextStyle(fontSize: 14),
    //当前选中文字颜色
    labelColor: Color(0xffffffff),
    unselectedLabelColor: Color(0xffeeeeee),
    tabs: Cons.homeTabs
      //标签widget
      .map((tab) =>
        Container(
          height: 40,
          alignment: Alignment.center,
          child: Text(tab),
        ),
      ).toList(),
  );

  //创建主页界面列表
  Widget _homeContent() => TabBarView(
    //根据列表创建界面列表
      children: Cons.homeTabs
          .map((text) => _buildContent(Cons.homeTabs.indexOf(text)))
          .toList()
  );
  
  
  Widget _buildContent(int index) {
    switch(index) {
      case 0:
        return GridPaper();
      case 1:
        return CanvasPage();
      case 2:
        return CustomPaint(
          painter: StartPainter(),
        );
      case 3:
        return CustomPaint(
          painter: ClockPainter(),
        );
    }
  }

}