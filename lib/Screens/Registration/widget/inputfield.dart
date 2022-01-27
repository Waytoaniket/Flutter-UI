import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sizer/sizer.dart';

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'enter a valid email address')
]);
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);

final requiredValidator =
    RequiredValidator(errorText: 'This field is required');

final ageValidator = MultiValidator([
  RequiredValidator(errorText: 'Age is required'),
  RangeValidator(errorText: 'Put valid age', min: 18, max: 150)
]);
final mobileNumValidator = MultiValidator([
  RequiredValidator(errorText: 'Mobile Number is required'),
  PatternValidator(r'^[6-9]\d{9}$', errorText: 'Enter valid phone Number')
]);

Widget getInputField(
    size,
    context,
    TextEditingController _firstName,
    TextEditingController _lastName,
    TextEditingController _email,
    TextEditingController _password,
    TextEditingController _confirmPassword,
    TextEditingController _mobileNumber,
    String professionType,
    bool passwordNotVisible,
    bool confirmedPasswordNotVisible,
    bool searchIndicator,
    Function changePasswordVisibility,
    Function changeConfirmedPasswordVisibility,
    Function changeDropDownValue) {
  return Padding(
    padding: EdgeInsets.only(left: size.width / 12, right: size.width / 12),
    child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.0, top: 5.h),
          child: Text(
            "SIGN UP CREDENTIALS",
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.pink,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.only(top: size.width / 30),
          alignment: Alignment.center,
          child: field(size, context, "First Name", Icons.person, _firstName,
              TextInputType.text,
              requiredValidator: requiredValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(size, context, "Last Name", Icons.person, _lastName,
              TextInputType.text,
              requiredValidator: requiredValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(size, context, "Email ID", Icons.email, _email,
              TextInputType.emailAddress,
              multiValidator: emailValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: passwordField(
              size,
              context,
              "Password",
              Icons.lock,
              passwordNotVisible ? Icons.visibility_off : Icons.visibility,
              _password,
              TextInputType.visiblePassword,
              passwordNotVisible,
              changePasswordVisibility,
              passwordValidator),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: confirmPasswordField(
            size,
            context,
            "Confirm Password",
            Icons.lock,
            confirmedPasswordNotVisible
                ? Icons.visibility_off
                : Icons.visibility,
            _confirmPassword,
            _password,
            TextInputType.visiblePassword,
            confirmedPasswordNotVisible,
            changeConfirmedPasswordVisibility,
          ),
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.only(top: 6),
          alignment: Alignment.center,
          child: field(
            size,
            context,
            "Mobile Number",
            Icons.phone,
            _mobileNumber,
            TextInputType.number,
            multiValidator: mobileNumValidator,
          ),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        getDropDownInput(context, professionType, changeDropDownValue),
      ],
    ),
  );
}

Widget field(Size size, context, String hintText, IconData icon,
    TextEditingController cont, TextInputType textinput,
    {MultiValidator? multiValidator,
    RequiredValidator? requiredValidator,
    RangeValidator? rangeValidator}) {
  final node = FocusScope.of(context);
  var validate = multiValidator == null
      ? (rangeValidator == null ? requiredValidator! : rangeValidator)
      : multiValidator;
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    onFieldSubmitted: (value) {},
    onEditingComplete: () => node.nextFocus(),
    keyboardType: textinput,
    textAlignVertical: TextAlignVertical.bottom,
    controller: cont,
    style: TextStyle(color: Colors.orange, fontSize: 18),
    decoration: InputDecoration(
      helperText: "",
      helperStyle: TextStyle(height: 0.5),
      errorStyle: TextStyle(height: 0.5),
      prefixIcon: iconDecoration(icon),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.orange, fontSize: 18),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width),
          borderSide: BorderSide.none),
      filled: true,
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.white,
    ),
    validator: validate,
  );
}

Widget passwordField(
    Size size,
    context,
    String hintText,
    IconData prefixIcon,
    IconData suffixIcon,
    TextEditingController cont,
    TextInputType textinput,
    bool visible,
    Function changeVisibility,
    MultiValidator validate) {
  final node = FocusScope.of(context);

  return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: textinput,
      textAlignVertical: TextAlignVertical.bottom,
      controller: cont,
      obscureText: visible,
      onEditingComplete: () => node.nextFocus(),
      style: TextStyle(color: Colors.orange, fontSize: 18),
      decoration: InputDecoration(
        prefixIcon: passwordIconDecoration(prefixIcon, changeVisibility),
        suffixIcon: passwordIconDecoration(suffixIcon, changeVisibility),
        helperText: "",
        helperStyle: TextStyle(height: 0.5),
        errorStyle: TextStyle(height: 0.5),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.orange, fontSize: 18),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(size.width),
            borderSide: BorderSide.none),
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: Colors.white,
      ),
      validator: validate);
}

Widget confirmPasswordField(
  Size size,
  context,
  String hintText,
  IconData prefixIcon,
  IconData suffixIcon,
  TextEditingController cont,
  TextEditingController pass,
  TextInputType textinput,
  bool visible,
  Function changeVisibility,
) {
  final node = FocusScope.of(context);

  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    keyboardType: textinput,
    textAlignVertical: TextAlignVertical.bottom,
    controller: cont,
    obscureText: visible,
    onEditingComplete: () => node.nextFocus(),
    style: TextStyle(color: Colors.orange, fontSize: 18),
    decoration: InputDecoration(
      prefixIcon: passwordIconDecoration(prefixIcon, changeVisibility),
      suffixIcon: passwordIconDecoration(suffixIcon, changeVisibility),
      helperText: "",
      helperStyle: TextStyle(height: 0.5),
      errorStyle: TextStyle(height: 0.5),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.orange, fontSize: 18),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width),
          borderSide: BorderSide.none),
      filled: true,
      contentPadding: EdgeInsets.all(16),
      fillColor: Colors.white,
    ),
    validator: (val) => MatchValidator(errorText: 'passwords do not match')
        .validateMatch(cont.text, pass.text),
  );
}

Widget iconDecoration(
  icon,
) {
  return Icon(
    icon,
    size: 28,
    color: Colors.amber,
  );
}

Widget passwordIconDecoration(icon, Function changeVisibility) {
  return InkWell(
    onTap: () {
      changeVisibility();
      print("pressed");
    },
    child: Icon(
      icon,
      size: 28,
      color: Colors.amber,
    ),
  );
}

Widget getDropDownInput(context, String professionType, Function changeValue) {
  final List<String> _data = [
    'App Developer',
    'Web Developer',
    'Backend Developer',
    'Forntend Developer',
    'Fullstack Developer'
  ];
  final node = FocusScope.of(context);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4.w),
    height: 6.5.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      color: Colors.white,
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.amber,
          size: 10.w,
        ),
        items: _data.map((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(
              val,
              style: TextStyle(color: Colors.orange, fontSize: 18),
            ),
          );
        }).toList(),
        hint: Text(
          professionType,
          style: TextStyle(color: Colors.orange, fontSize: 18),
        ),
        onChanged: (String? val) {
          node.nextFocus();
          changeValue(val);
        },
      ),
    ),
  );
}
