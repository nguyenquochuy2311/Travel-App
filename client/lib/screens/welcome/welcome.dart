import 'package:client/screens/welcome/components/letStart.dart';
import 'package:client/screens/welcome/components/welcome.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LetStart(),
    );
  }
}
