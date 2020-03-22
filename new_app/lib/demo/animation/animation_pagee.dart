import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

// class AnimatedLogo extends AnimatedWidget{
//   AnimatedLogo({Key key,Animation<double> animation}):super(key:key,listenable:animation);

//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return Center(
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         height: animation.value,
//         width: animation.value,
//         child: FlutterLogo(),
//       ),
//     );
//   }
// }

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        width: animation.value,
        height: animation.value,
        child: child,
      ),
      child: child,
    );
  }
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(child:LogoWidget(),animation:animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
