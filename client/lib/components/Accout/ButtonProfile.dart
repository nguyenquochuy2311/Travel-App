import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({
    key,
    required this.icon,
    required this.name,
    required this.press,
  }) : super(key: key);
  final String icon;
  final String name;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextButton(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 2.2, color: Colors.grey),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 300,
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: kFontSize,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
            ),
            Container(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.fitHeight,
                )),
          ],
        ),
      ),
      onPressed: press,
    );
  }
}
