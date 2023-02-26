# travels

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Dart
## 常用数据类型:
### 数字类型：num
    ·int
    ·double
    num、int、double都是类，默认值为null，不同于java的基本类型
### 布尔类型：关键字为bool
    ·true
    ·false

### 字符串类型：String
    dart支持'xx' "xx"  '''xx'''，单引号、双引号需要转义，三引号将内容原样输出，${exp}可以在字符串内插入字符串表达式exp
### 列表类型：List
    add 添加
    removeAt 移出
    insert 定点插入
    getRange获取指定访问的元素
    join 以指定字符串拼接元素
    contains 是否包含
    clear 清空
    元素类型转换：
    List<String> strNum = ['11','23','34','24','65'];
    var intNum = strNum.map((String str)=>int.parse(str)）.to>List()
    条件遍历过滤出列表：通过map函数遍历列表并生成新元素列表：
    var bigThan30 = intNum.where((int num)=>num>30).toList();
    列表解构：
    var parse=[0,100,...intNum,30]; //[0,100,11,23,34,24,65,30]
    构造列表时允许执行if语句：
    bool flag=bigThan30.length>=3;
    var chooseLi=[if(!flag) 666,...parse,if(flag) 555 else 55];   //666,0,100,11,23,34,24,65,30,55
### 集合类型：Set
    集合种元素不能重复，添加重复元素时返false，表示无法加
    {1,2,3,4}.difference({2,3,6});  //{1,4} 两个不同元素构成的集合
    {1,2,3,4}.union({2,3,6})        //{1,2,3,4,6}   并集
    {1,2,3,4}.intersection({2,3,6}) //{2,3} 交集
### Map类型（映射类型）：Map
    Map<String,num> dict={"a":1,"b":30,"c":70,"price":40.0}
    dict["price"]   //40.0
    dict["a"]=2     //修改
    dict.containsKey("price")   //是否包含键
    dict.containsValue("price") //是否包含值
    dict.isEmpty
    dict.remove("c")    //移除
    dict.keys.toList()  //将键转为数组
    dict.values.toList()//将值转为数组
    List<int> numLi=[1,2,3,4,5];
    List<String> numEN=["1","2","3","4","5"];
    List<String> numCN=["11","22","33","44","55"];
    Map<int,String> mapEn=Map.fromIterables(numLi,numEN);
    Map<int,String> mapCn=Map.fromIterables(numLi,numCN);

## 变量与常量
### 变量
    ·强类型编程语言，定义变量时可用var关键字替换变量类型
    ·只用var声明变量，未赋值，则该变量的数据类型可以修改（dynamic）。若声明的同时进行赋值，则该对象的类型就是固定的，不可修改。
### 常量
    ·定义后不能再改变，用const、final定义常量
    ·const是编译期常量，final是运行时常量

## 函数
### 函数的基本用法
    ·定义
        返回值类型 函数名（) {
        ...
        }
    ·使用[]指定若干个可选参数，使用时入参必须按着定义顺序
    ·使用{}指定若干个可选参数，使用时类似键值对，通过键名进行传参：
        Color randomColor({int limitA=120, int limitF=0, int limitC=0, int limitB=0,}) {
            ...
        }
        //调用
        random（limitA:100, limitB）;
### 函数类型
    ·一切皆是对象，对象的运行时类型可以通过xx.gettimeType获取
    ·函数可做变量
        num add(num a, num b, {Function op}) {
            return op(a) + op(b);
        }
        //定义一个函数变量
        Function square=(a){return a*a;}
        //
        print(add(-3,4,op:square);
### 函数简写
    ·入参、返回值类型可省略，省略后ide无法提示相关api
    ·函数体只有一行时,=>表示执行并返回语句结果；
        num add(num a, num b, {Function op})=>op(a)+op(b);
### 工具类的封装

## 类的运算符重载
    ·operator关键字
## 类继承+扩展
## 接口的定义&使用
    ·使用abstract关键字，不同于java

## 常见符号、关键字
### 变量插入字符串 ${exp}
    ·将变量插入字符串中
    ·空判执行符 exp1??exp2   //表达式exp1为空会执行exp2，否则不执行exp2
    ·条件调用符 obj?.op()    //调用对象obj为null时不调用op()，否则正常调用
    ·两点级联操作符代表当前对象：
        var paint = Paint()；
        paint
            ..strokeCap=StrokeCa.round
            ..style=PaintingStyle.stroke
            ..color=Color(0xffBBc3c5);
    ·三点解构：
    使用...将列表解构成一个个元素，可直接以元素形式添加另一个列表：
        var lang=<String>["java","Kotlin"];
        print(["dart","python",...lang]);
    ·关键字：is、is!、as
        ·is/is!判断一个对象是否是某个类型；
        ·as进行强制类型转换，或引发类型转换异常；
### 库的使用和可见性
    ·写法：
        import 'package:flutter_journey/util/.../xx.dart'；
        import '../xx.dart'；
    ·使用as为冲突包改名
    ·library与export：
        library xxx;
        export 'src/meterial/xxx.dart';
    ·控制显隐实现部分导入：
        import 'package:flutter/color.dart' show sin; //只显示sin函数
        import 'package:flutter/color.dart' hide sin; //只隐藏sin函数
### 泛型
    ·var关键字无法指定泛型，定义形式使用：
        var ss = <String>['java','Dart']；
#### 泛型类的定义与限定
    ·类名后加上<泛型类>，则该类中可以使用泛型类：
        abstract class Animatable<T> {
            const Animatable();
            T transform(double t);
            T evaluate(Animation<T> animation) => transform(animation.value);
        }
    ·若要限定泛型的范围，使用extends关键字：
    //Sate类中的泛型类必须继承自StatefulWidget，实现限定泛型,就可以使用泛型的方法和属性
    abstract class State<T extends StatefulWidget> extends Diagnosticable{
        xxx
    }
    ·泛型方法：
    //then方法接受泛型R，返回R泛型的Future对象，FutureOr<R>类型的入参，通过onValue将一个T泛型的值回调。onError为一个键值参数
    Future<R> then<R>(FutureOr<R> onValue(T value), {Function onError});

### 异步
#### async await
    ·async（修饰方法）表示异步，await（标识在Future对象前）表示等待：
    Future<Water> heat() async {
        var water = await Water(0).heat();
        return water;
    }

###异常处理
    ·用on关键字来分别对每个异常进行捕捉：
    try{
        xx
    }on xxException catch(e){
        xxx
    }on xx2Exception cath(e){
        xxxx
    }finally{
        xxxxx
    }
