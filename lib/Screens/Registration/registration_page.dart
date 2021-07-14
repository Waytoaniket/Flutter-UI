import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/Registration/widget/appbar.dart';
import 'package:housy/Screens/Registration/widget/inputfield.dart';
import 'package:housy/Screens/Registration/widget/registrationbutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'register_screen';

  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String professionType = 'Select Your Profession';

  bool passwordNotVisible = true;
  bool confirmedPasswordNotVisible = true;
  bool userNmaeTaken = false;
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
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    registrationAppBar(context),
                    getInputField(
                        size,
                        context,
                        _firstName,
                        _lastName,
                        _email,
                        _password,
                        _confirmPassword,
                        _mobileNumber,
                        professionType,
                        passwordNotVisible,
                        confirmedPasswordNotVisible,
                        userSearchIndicator,
                        changePasswordVisibility,
                        changeConfirmedPasswordVisibility,
                        updateDropDownValue),
                    SizedBox(
                      height: size.width / 8,
                    ),
                    registrationButton(
                      context,
                      size,
                      _formKey,
                      _firstName,
                      _lastName,
                      _email,
                      _password,
                      _mobileNumber,
                      professionType,
                      updateIndicator,
                    ),
                    SizedBox(
                      height: size.width / 12,
                    ),
                  ],
                ),
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

  void changeConfirmedPasswordVisibility() {
    setState(() {
      confirmedPasswordNotVisible = !confirmedPasswordNotVisible;
    });
  }

  void updateDropDownValue(String val) {
    setState(() {
      professionType = val;
    });
  }
}
