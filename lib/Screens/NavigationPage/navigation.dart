import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/ContactInfo/contact_info.dart';
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
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    drawerIndex = DrawerIndex.HOME;
    screenView = HomePage(
      callback: _toggleAnimation,
      animationController: _animationController,
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
            DrawerData(
              callback: changeIndex,
              drawerIndex: drawerIndex,
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..scale(scale),
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: _animationController!.isCompleted
                      ? BorderRadius.circular(10.w)
                      : BorderRadius.zero,
                  child: screenView),
            ),
          ],
        );
      },
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    _toggleAnimation();
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = HomePage(
            callback: _toggleAnimation,
            animationController: _animationController,
          );
        });
      } else if (drawerIndex == DrawerIndex.Info) {
        setState(() {
          screenView = ContactInfo(
            callback: _toggleAnimation,
            animationController: _animationController,
          );
        });
      } else {
        //do in your way......
      }
    }
  }
}

enum DrawerIndex {
  HOME,
  Info,
}
