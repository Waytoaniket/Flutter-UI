import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/HomePage/home_page.dart';
import 'package:housy/Screens/Drawer/drawer.dart';
import 'package:sizer/sizer.dart';

class NavigationPage extends StatefulWidget {
  static const String id = 'NavigationPage';

  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage>
    with TickerProviderStateMixin {
  // final GlobalKey<Scaffold> _scaffold = GlobalKey();
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  _toggleAnimation() {
    _animationController!.isDismissed
        ? _animationController!.forward()
        : _animationController!.reverse();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        double slide = 50.w * _animationController!.value;
        double scale = 1 - (_animationController!.value * 0.3);
        return Stack(
          children: [
            DrawerData(),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: _animationController!.isCompleted
                    ? BorderRadius.circular(10.w)
                    : BorderRadius.zero,
                child: HomePage(
                  callback: _toggleAnimation,
                  animationController: _animationController,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
