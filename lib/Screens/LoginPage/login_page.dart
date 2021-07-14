import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/LoginPage/widget/login_appbar.dart';
import 'package:housy/Screens/LoginPage/widget/login_button.dart';
import 'package:housy/Screens/LoginPage/widget/login_inputfield.dart';
import 'package:housy/Screens/Registration/registration_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool passwordNotVisible = true;
  bool userSearchIndicator = false;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Colors.blue,
        ),
        inAsyncCall: isLoading,
        child: Container(
          height: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginAppBar(context),
                  Expanded(child: Container()),
                  getInputField(
                    size,
                    context,
                    _email,
                    _password,
                    passwordNotVisible,
                    changePasswordVisibility,
                  ),
                  SizedBox(
                    height: size.width / 8,
                  ),
                  loginButton(
                    context,
                    size,
                    _formKey,
                    _email,
                    _password,
                    updateIndicator,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationPage.id);
                    },
                    child: Text(
                      "Click Here To Register",
                      style:
                          TextStyle(color: Colors.deepOrange, fontSize: 14.sp),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateIndicator() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changePasswordVisibility() {
    setState(() {
      passwordNotVisible = !passwordNotVisible;
    });
  }
}
