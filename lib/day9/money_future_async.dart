import 'dart:io';

main() {
  print("小明想要10元买零食: ${DateTime.now()}");
  // Mom.getMoney(10.0).then((value) => XiaoMing.butFood(value));
  Mom.getMoney(10.0).then((value) {
    XiaoMing.butFood(value);
  }).catchError((e) {
    print(e);
    print("好吧，我不吃零食了");
  });
  print("小明写作业: ${DateTime.now()}");
}

class Mom {
  static Future<Money> getMoney(value) {
    print("妈妈现在没有零钱，我先去买菜，回来给你: ${DateTime.now()}");
    // return Future(() {
    //   sleep(Duration(seconds: 5));
    //   print("妈妈回来了，给你零钱: ${DateTime.now()}");
    //   throw Exception("妈妈的钱包被偷了");
    //   return Money(value);
    // });
    return Future.delayed(Duration(seconds: 5), () {
      sleep(Duration(seconds: 5));
      print("妈妈回来了，给你零钱: ${DateTime.now()}");
      throw Exception("妈妈的钱包被偷了");
      return Money(value);
    });
  }
}

class XiaoMing {
  static butFood(Money money) {
    if(money.value==10.0) {
      print("小明买到了零食:"
          "${DateTime.now()}");
    }
  }
}

class Money {
  double value;
  Money(this.value);
}