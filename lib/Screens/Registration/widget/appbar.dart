import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget registrationAppBar(context) {
  return SizedBox(
    height: AppBar().preferredSize.height,
    child: Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top - 4,
        left: 8,
        right: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: AppBar().preferredSize.height,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.pink,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              'Welcome to Housy!',
              style: TextStyle(
                fontSize: 22,
                color: Colors.pink,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
