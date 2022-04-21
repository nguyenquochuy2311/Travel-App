import 'package:client/config/theme.dart';
import 'package:client/screens/account/components/header.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [HeaderAccount()],
        ),
      ),
    );
  }
}
