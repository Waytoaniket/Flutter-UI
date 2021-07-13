import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/HomePage/widgets/customSearch.dart';

AppBar appbar(BuildContext context, AnimationController animationController,
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
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        color: Colors.black,
        tooltip: 'Search Icon',
        onPressed: () {
          showSearch(
            context: context,
            delegate: CustomSearchDelegate(),
          );
        },
      ),
    ],
  );
}
