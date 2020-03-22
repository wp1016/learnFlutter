import 'package:flutter/material.dart';
import 'package:new_app/dart/function_learn.dart';
import 'package:new_app/dart/generic_learn.dart';
import 'package:new_app/dart/oop_learn.dart';
import './dart/data_type.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart'; // 插件使用

import './widget/stateless.dart'; // 无状态组件
import './widget/stateful.dart'; // 有状态组件
import './widget/flutter_layout_page.dart'; // 布局
import './gesture/gesture_page.dart'; // 手势
import './resource/resourcePage.dart'; // 如何使用和导入资源
import './launcher/launch_page.dart'; // 如何打开第三方App
import './lifecycle/flutter_widget_lifecycle.dart'; // 页面声明周期
import './lifecycle/flutter_app_lifecycle.dart'; // app生命周期
import './photo/photo_page.dart'; // 拍照App

import './animation/animation_pagee.dart'; //动画
import './animation/hero_page.dart'; // hero动画

void main() => runApp(DynamicThemeState());

class DynamicThemeState extends StatefulWidget {
  DynamicThemeState({Key key}) : super(key: key);

  @override
  _DynamicThemeStateState createState() => _DynamicThemeStateState();
}

class _DynamicThemeStateState extends State<DynamicThemeState> {
  Brightness _brightness = Brightness.light;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Baloo2',
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由使用'),
        ),
        body: Column(
          children: <Widget>[
            Container(
                child: Image.network(
                    'https://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg',
                    width: 80,
                    height: 80)),
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_brightness == Brightness.light) {
                    _brightness = Brightness.dark;
                  } else {
                    _brightness = Brightness.light;
                  }
                });
              },
              child: Text('切换主题'),
            ),
            RouterNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayout(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        'appLifecycle': (BuildContext context) => AppLifeCycle(),
        'photo': (BuildContext context) => PhotoPage(),
        'animate': (BuildContext context) => AnimationPage(),
        'hero': (BuildContext context) => HeroPage(),
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 必备Dart知识',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('路由使用'),
        ),
        body: RouterNavigator(),
      ),
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroup(),
        'layout': (BuildContext context) => FlutterLayout(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        'appLifecycle': (BuildContext context) => AppLifeCycle(),
      },
    );
  }
}

class RouterNavigator extends StatefulWidget {
  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    // _oopLearn(); // 面向对象
    // _functionLearn(); // 函数
    // _genericLeearn();
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('是否通过路有名跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('StatelessWidgeet与基础组件', LessGroupPage(), 'less'),
          _item('StatefulWidgeet与基础组件', StatefulGroup(), 'ful'),
          _item('flutter布局组件', FlutterLayout(), 'layout'),
          _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
          _item('如何使用和导入资源', ResPage(), 'resource'),
          _item('如何打开第三方App', LaunchPage(), 'launch'),
          _item('页面生命周期', WidgetLifecycle(), 'widgetLifecycle'),
          _item('App生命周期', AppLifeCycle(), 'appLifecycle'),
          _item('拍照App', PhotoPage(), 'photo'),
          _item('动画', AnimationPage(), 'animate'),
          _item('hero动画', HeroPage(), 'hero')
        ],
      ),
    );
  }

  _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
          onPressed: () {
            if (byName) {
              Navigator.pushNamed(context, routeName);
            } else {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            }
          },
          child: Text(title)),
    );
  }

  void _oopLearn() {
    print('---_oopLearn---');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);

    Student.doPrint('_oopLearn');
    // 创建Student 的对象
    Student stu1 = Student('Jack', 18, '清华');
    stu1.school = '985';
    print(stu1.toString());

    Student stu2 = Student('Tom', 16, '北大', city: '上海', country: '中国');
    print(stu2);

    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }

  void _functionLearn() {
    TestFunction testFunction = TestFunction();
    testFunction.start();
  }

  void _genericLeearn() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
