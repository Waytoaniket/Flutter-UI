import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:housy/Screens/NavigationPage/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget loginButton(
  context,
  Size size,
  _formKey,
  TextEditingController _email,
  TextEditingController _password,
  Function updateIndicator,
) {
  return InkWell(
    splashColor: Theme.of(context).primaryColorLight,
    onTap: () async {
      print("validate");

      if (_formKey.currentState!.validate()) {
        updateIndicator();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? email = prefs.getString('email');
        String? password = prefs.getString('password');
        if (_email.text == email && _password.text == password) {
          Navigator.pushReplacementNamed(context, NavigationPage.id);
        }
        else{
          updateIndicator();
          Fluttertoast.showToast(
                msg: 'Invaild Credentials',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1);
        }
        print("done");
      }
    },
    child: Container(
      height: size.height / 15,
      width: size.width / 2.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width),
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.pink,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        "Sign In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
