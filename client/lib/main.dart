import 'package:client/config/theme.dart';
import 'package:client/screens/homePage/home_page.dart';
import 'package:client/screens/loginAndRegistor/components/login/login.dart';
import 'package:client/screens/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        fontFamily: kFontFamily,
        primarySwatch: Colors.blue,
      ),
      home: const Welcome(),
    );
  }
}
