import 'package:client/components/rounded_button.dart';
import 'package:client/config/theme.dart';
import 'package:client/screens/welcome/components/welcome.dart';
import 'package:flutter/material.dart';

class LetStart extends StatelessWidget {
  const LetStart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("public/images/background_home.jpeg"),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 65, 0, 20),
            width: 95,
            height: 95,
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage("public/images/logo.png"),
              ),
              color: kPrimaryColor,
            ),
          ),
          Container(
            height: size.height * 0.5,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 13),
                  child: const Text(
                    "Peshot",
                    style: TextStyle(
                        fontSize: 46,
                        fontWeight: FontWeight.w900,
                        fontFamily: headerFont,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: const Text(
                    "Welcome to peshot",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: kFontFamily,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  child: const Text(
                    "Book easy and cheap hotels only on Peshot",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: kFontFamily,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                RoundedButton(
                  text: "Let's Start",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Welcome()));
                  },
                  color: kSecondColor,
                ),
                Container(
                  child: const Text(
                    'Click to continue',
                    style: TextStyle(
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        letterSpacing: 1,
                        color: Colors.black),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
