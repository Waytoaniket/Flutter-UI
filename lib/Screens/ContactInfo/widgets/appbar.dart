import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar contactAppbar(BuildContext context, AnimationController animationController,
    Function callback) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xFFFFB266),
    leading: IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: animationController,
        color: Colors.black,
      ),
      tooltip: 'Menu',
      onPressed: () => callback(),
    ),
   
  );
}
