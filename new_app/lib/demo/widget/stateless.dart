import 'package:flutter/material.dart';


class LessGroupPage extends StatefulWidget {
  LessGroupPage({Key key, this.title}) : super(key: key);

  final title;

  @override
  _LessGroupPageState createState() => _LessGroupPageState();
}

class _LessGroupPageState extends State<LessGroupPage> {
  TextStyle textStyle = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidgeet与基础组件'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text('Container widget', style: textStyle),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('StatelessWidget组件'),
              ),
              Divider(
                height: 10,
                indent: 10,
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'I an Card',
                    style: textStyle,
                  ),
                ),
              ),
              AlertDialog(
                title: Text('盘他'),
                content: Text('你这个糟老头子坏得很'),
              )
            ],
          ),
        ));
  }
}
