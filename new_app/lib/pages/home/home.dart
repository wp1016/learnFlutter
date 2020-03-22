import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/http/commonModel.dart';
import 'package:new_app/sharedPreferences/shared_preferences.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showResult = '';

  List _imageUrls = [
    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=547082689,2172122564&fm=11&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2071462358,1247829596&fm=26&gp=0.jpg',
    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2124005431,1038138669&fm=11&gp=0.jpg'
  ];

  double _appBarAlpha = 0;

  Future<CommonModel> fetchPost() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removeViewPadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (ScrollNotification scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return null;
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      itemCount: _imageUrls.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          _imageUrls[index],
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Container(
                    height: 800,
                    child: Column(
                      children: <Widget>[
                        FutureBuilder<CommonModel>(
                          future: fetchPost(),
                          builder: (BuildContext context,
                              AsyncSnapshot<CommonModel> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return new Text('Input a Url to start');
                              case ConnectionState.waiting:
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.active:
                                return Text('');
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return Text(
                                    '${snapshot.error}',
                                    style: TextStyle(color: Colors.red),
                                  );
                                } else {
                                  return Column(
                                    children: <Widget>[
                                      Text('icon:${snapshot.data.icon}'),
                                      Text(
                                          'statusBarColor:${snapshot.data.statusBarColor}'),
                                      Text(
                                          'hideAppBar:${snapshot.data.hideAppBar}'),
                                      Text('title:${snapshot.data.title}'),
                                      Text('url:${snapshot.data.url}'),
                                    ],
                                  );
                                }
                            }
                            return null;
                          },
                        ),
                        SharedPreferencesDemo()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Opacity(
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
            opacity: _appBarAlpha,
          ),
        ],
      ),
    );
  }
}
