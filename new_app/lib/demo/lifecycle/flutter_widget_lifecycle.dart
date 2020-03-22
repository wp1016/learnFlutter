import 'package:flutter/material.dart';

// Flutter Widget 的生命周期重点讲解StatefulWidget的声明周期
// 因为无状态的 widget StatelessWidget 只有 createElement、与build两个声明周期方法
// StatefulWidget的生命周期方法按照时期不同可以分为三组：
// 1. 初始化时期
// createState、initState
// 2. 更新时期
// didChangeDependencies、build、disUpdateWidget
// 3. 销毁期
// deactivate、dispose
//
//
//

class WidgetLifecycle extends StatefulWidget {
  WidgetLifecycle({Key key}) : super(key: key);
  // 当我们构建一个新的StatefulWidget时，这个会立即调用，并且这个方法必须重写
  @override
  _WidgetLifecycleState createState() => _WidgetLifecycleState();
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  int _count = 0;

  @override
  void initState() {
    print('----initState----');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('----didChangeDependencies----');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('----build----');

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter组件声明周期'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString())
          ],
        ),
      ),
    );
  }
  // 这是一个不常用的生命周期方法，当父组件需要重新绘制时才会调用；
  // 该方法会携带一个oldWidget参数，可以将其与当前的Widget进行对比以便执行一些额外的逻辑，如：
  // if(oldWidget.xxx != widget.xxx)...
  @override
  void didUpdateWidget (WidgetLifecycle oldWidget) {
    print('----didUpdateWidget-----');
    super.didUpdateWidget(oldWidget);
  }

  // 很少使用，在组件被移除时调用在dispose调用之前
  @override
  void deactivate() {
    print('----deactivate-----');
    super.deactivate();
  }

  // 常用，组件被销毁时调用
  // 通常在该方法中执行一些资源的释放工作比如，监听器的协作，channel的销毁等
  @override
  void dispose() {
    print('----dispose-----');
    super.dispose();
  }
}
