import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/NavigationPage/navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget registrationButton(
  context,
  Size size,
  _formKey,
  TextEditingController _firstName,
  TextEditingController _lastName,
  TextEditingController _email,
  TextEditingController _password,
  TextEditingController _mobileNumber,
  String profession,
  Function updateIndicator,
) {
  return InkWell(
    splashColor: Theme.of(context).primaryColorLight,
    onTap: () async {
      print("validate");

      if (_formKey.currentState!.validate()) {
        updateIndicator();
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('firstName', _firstName.text);
        await prefs.setString('lastName', _lastName.text);
        await prefs.setString('email', _email.text);
        await prefs.setString('password', _password.text);
        await prefs.setString('mobileNumbaer', _mobileNumber.text);
        await prefs.setString('profession', profession);
        print("done");
        Navigator.pushReplacementNamed(context, NavigationPage.id);
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
        "Sign Up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
