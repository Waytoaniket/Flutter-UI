import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget registrationButton(
  context,
  Size size,
  _formKey,
  TextEditingController _userName,
  TextEditingController _firstName,
  TextEditingController _lastName,
  TextEditingController _email,
  TextEditingController _password,
  TextEditingController _age,
  TextEditingController _gender,
  TextEditingController _mobileNumber,
  TextEditingController _city,
  Function updateIndicator,
) {
  return InkWell(
    splashColor: Theme.of(context).primaryColorLight,
    onTap: () {
      print("validate");

      if (_formKey.currentState!.validate()) {}
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
