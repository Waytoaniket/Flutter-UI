import 'package:flutter/material.dart';
import 'package:housy/Screens/ContactInfo/contact_info.dart';
import 'package:housy/Screens/HomePage/home_page.dart';
import 'package:housy/Screens/Drawer/drawer.dart';
import 'package:housy/Screens/LoginPage/login_page.dart';
import 'package:housy/Screens/NavigationPage/navigation.dart';
import 'package:housy/Screens/Registration/registration_page.dart';
import 'package:housy/authenticate.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sizer',
          theme: ThemeData.light(),
          home: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Housy',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute: Authenticate.id,
            routes: {
              HomePage.id: (context) => HomePage(),
              NavigationPage.id: (context) => NavigationPage(),
              RegistrationPage.id: (context) => RegistrationPage(),
              Authenticate.id: (context) => Authenticate(),
              LoginPage.id: (context) => LoginPage(),
              ContactInfo.id: (context) => ContactInfo(),



            },
          ),
        );
      },
    );
  }
}
