import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loginAppBar(context) {
  return SizedBox(
    height: AppBar().preferredSize.height,
    child: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top - 4,
        left: 8,
        right: 8,
      ),
      child: Text(
        'Welcome to Housy!',
        style: TextStyle(
          fontSize: 22,
          color: Colors.pink,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
