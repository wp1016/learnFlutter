import 'package:flutter/material.dart';

// 如何导入和使用资源
class ResPage extends StatefulWidget {
  ResPage({Key key}) : super(key: key);

  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何导入和使用资源'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/success.png'),
              width: 80,
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
