import 'package:client/config/theme.dart';
import 'package:client/screens/home/components/home_first.dart';
import 'package:client/screens/home/home.dart';
import 'package:client/screens/homePage/components/home.dart';
import 'package:client/screens/homePage/home_page.dart';
import 'package:client/screens/login/login.dart';
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
      home: HomeFirst(),
    );
  }
}
