import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housy/Screens/LoginPage/login_page.dart';
import 'package:housy/Screens/NavigationPage/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate extends StatefulWidget {
  static const String id = 'Authenticate';
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  String? userName;
  getUserData() async {
    await SharedPreferences.getInstance().then((value) => {
          if (mounted)
            {
              setState(() {
                userName = value.getString("firstName");
              })
            }
        });
  }

  void isSignIn() async {
    await getUserData();
    if (userName != null) {
      Navigator.pushReplacementNamed(context, NavigationPage.id);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.id);
    }
  }

  @override
  void initState() {
    super.initState();
    isSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
      )),
    );
  }
}
