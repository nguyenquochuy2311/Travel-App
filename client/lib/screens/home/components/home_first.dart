import 'package:client/config/theme.dart';
import 'package:client/screens/home/components/home_second.dart';
import 'package:flutter/material.dart';

class HomeFirst extends StatelessWidget {
  const HomeFirst({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 514,
      height: 896,
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
            height: size.height * 0.2 + 200,
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
                        fontSize: 16,
                        fontFamily: kFontFamily,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  child: const Text(
                    "Book easy and cheap hotels only on Peshot",
                    style: TextStyle(
                        fontSize: 16,
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
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 32, 0, 13),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(4, 4))
                      ]),
                  child: TextButton(
                    style: (ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kSecondColor),
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(340),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(vertical: 16)),
                        alignment: Alignment.center,
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeSecond()),
                      );
                    },
                    child: const Text(
                      'Let\'s Start',
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                      maxLines: 24,
                      textAlign: TextAlign.center,
                    ),
                  ),
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
