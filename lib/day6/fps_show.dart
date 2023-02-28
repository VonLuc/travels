import 'package:flutter/cupertino.dart';

class FpsShow extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FpsShowState();
}

class _FpsShowState extends State<FpsShow> with SingleTickerProviderStateMixin {
  //文字
  String _fps = '';

  //动画控制器
  late AnimationController controller;

  //首次运行时间
  var _oldTime = DateTime.now().microsecondsSinceEpoch;

  @override
  void initState() {
    //创建AnimationController对象
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    //添加监听，执行渲染
    controller.addListener(_render);
    //重复不断执行动画
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    //资源释放
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(-0.98, 0.98),
      child: Text("FPS:$_fps"),
    );
  }

  //渲染方法，更新状态
  _render() {
    setState(() {
      //新时间
      var now = DateTime.now().microsecondsSinceEpoch;
      //两次刷新间隔的毫秒值
      var dt = now - _oldTime;
      //1000毫秒可以刷新多少次及fps
      _fps = (1000 / dt).toStringAsFixed(1);
      print(_fps);
      //重新赋值
      _oldTime = now;
    });
  }
}
