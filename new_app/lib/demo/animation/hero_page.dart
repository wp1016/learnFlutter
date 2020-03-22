import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PhotoHero extends StatelessWidget {
  PhotoHero({Key key, this.photo, this.onTap, this.width}) : super(key: key);
  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(photo, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}

class HeroAnimatioon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0;
    return Center(
      child: PhotoHero(
        photo:
            'https://img4.sycdn.imooc.com/szimg/5c7e6835087ef3d806000338-360-202.jpg',
        width: 200.0,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text('hero'),
              ),
              body: Container(
                color: Colors.lightBlueAccent,
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: PhotoHero(
                  photo:
                      'https://img4.sycdn.imooc.com/szimg/5c7e6835087ef3d806000338-360-202.jpg',
                  width: 100,
                  onTap: () {
                    Navigator.of(context);
                  },
                ),
              ),
            );
          }));
        },
      ),
    );
  }
}

class HeroPage extends StatefulWidget {
  HeroPage({Key key}) : super(key: key);

  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero 动画'),
        leading: BackButton(),
      ),
      body: HeroAnimatioon(),
    );
  }
}
