import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({key, required this.country, required this.type})
      : super(key: key);
  final String country;
  final String type;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(80), // Set this height
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 25.0, 0.0, 25.0),
              color: Colors.transparent,
              child: TextButton(
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: 40,
                  color: type == "NationalDetail" ? Colors.black : Colors.white,
                ),
                onPressed: () => {Navigator.pop(context)},
              ),
              alignment: Alignment.centerLeft,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              color: Colors.transparent,
              child: Text(
                country,
                style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                    fontFamily: kFontFamily),
              ),
              alignment: Alignment.center,
            ),
            type == "NationalDetail"
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 25.0),
                    child: SvgPicture.asset(
                      "public/images/like.svg",
                      width: 24.0,
                      height: 24.0,
                    ),
                    alignment: Alignment.centerRight,
                  )
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100.0)),
                    child: SvgPicture.asset(
                      "public/images/like.svg",
                      color: kSecondColor,
                      width: 24.0,
                      height: 24.0,
                    ),
                  )
          ],
        ));
  }
}
