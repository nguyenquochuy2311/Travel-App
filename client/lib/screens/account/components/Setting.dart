import 'package:client/components/Accout/ButtonProfile.dart';
import 'package:client/components/backToScreen.dart';
import 'package:client/config/theme.dart';
import 'package:client/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Setting extends StatelessWidget {
  const Setting({
    key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), // Set this height
          child: BackToScreen(),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Setting",
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox.fromSize(size: const Size(37.0, 37.0)),
              ButtonProfile(
                  icon: "public/images/bell.svg",
                  name: "Notification",
                  press: () => {},
                  mode: "icon"),
              ButtonProfile(
                  icon: "Viet Nam",
                  name: "Country",
                  press: () => {},
                  mode: "text"),
              ButtonProfile(
                  icon: "VND", name: "Currency", press: () => {}, mode: "text"),
              ButtonProfile(
                  icon: "public/images/chevron-right.svg",
                  name: "Terms of Service",
                  press: () => {},
                  mode: "icon"),
              ButtonProfile(
                  icon: "public/images/chevron-right.svg",
                  name: "Help Center",
                  press: () => {},
                  mode: "icon"),
              ButtonProfile(
                  icon: "",
                  name: "Log out",
                  press: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login())),
                  mode: "text"),
            ],
          )),
        ));
  }
}
