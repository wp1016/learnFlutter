import 'package:flutter/material.dart';

// 常用数据类型
class DateType extends StatefulWidget {
  DateType({Key key}) : super(key: key);

  @override
  _DateTypeState createState() => _DateTypeState();
}

class _DateTypeState extends State<DateType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(
      child: Text('常用数据类型，查看控制台输出'),
    );
  }

  // 数字类型
  void _numType() {
    num num1 = -1.0; //是数字类型的父类，
    num num2 = 2;
    int int1 = 3;
    double double1 = 1.68;
    print("num:$num1 num:$num2 int:$int1 doouble: $double1");
    print(num1.abs()); // 求绝对值
  }

  void _stringType() {
    String str1 = '字符串', str2 = "双引号";
    String str3 = str1 + str2;
    String str4 = '$str1 $str2';
    String str5 = '常用数据类型，请看控制台输出';
    print(str3);
    print(str4);
    // 常用方法
    print(str5.substring(3, 6));
  }

  // 布尔类型，Dart是强bool类型检查，只有bool 类型的值是 true 才被认为是tru
  void _boolType() {
    bool success = true, fail = false;
    print(success);
    print(fail);
    print(success || fail);
    print(success && fail);
  }

  // List集合
  void _listType() {
    print('----_listType---');
    // 集合初始化的方式
    List list = [1, 2, 3, '集合']; // 初始化时添加元素
    print(list);
    // List<int> list2 = [3, 2, 3];
    // list2 = list;// 错误做法，类型不同
    List list3 = [];
    list3.add('list3'); //通过add方法添加元素
    list3.addAll(list);
    print(list3);
    List list4 = List.generate(3, (index) => index * 2);
    print(list4);

    // 遍历集合的方式
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }

    for (var o in list) {
      print(o);
    }

    list.forEach((val) {
      print(val);
    });

    list.remove(2);
    print(list);
  }

  // map类型，key,value键值对对象
  void _mapType() {
    print('---_mapType---');
    // Map初始化
    Map names = {'xiaoming': '小明', 'xiaohong': '小红'};
    print(names);
    Map ages = {};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print(ages);

    // 遍历方式
    ages.forEach((k,v){
      print('$k , $v');
    });

   Map ages2 = ages.map((k,v){
      return MapEntry(v, k);
    });
    print(ages2);

    for (var key in ages.keys) {
      print('$key ${ages[key]}');
    }
  }

  // dynamic、var、Object 三者的区别

  _tips(){
    print('---_tips---');
    // dynamic
    dynamic x = 'hal'; // 动态数据类型,编译时确定数据类型
    // x = 123;
    // x = [1,2,3];
    // x = {};
    // x = null;
    print(x.runtimeType);

    // var 定义时就确定数据类型，声明后的变量数据类型不可更改
    var a = 'var';
    print(a.runtimeType);
    print(a);

    //Object
    Object o1 = '111';
    print(o1.runtimeType);
    print(o1);
  }
  
}
