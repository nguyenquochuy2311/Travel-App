import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonProfile extends StatelessWidget {
  const ButtonProfile({
    key,
    required this.icon,
    required this.name,
    required this.press,
    required this.mode,
  }) : super(key: key);
  final String icon;
  final String name;
  final String mode;
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
        child: Stack(
          children: [
            Container(
              child: Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: kFontSize,
                    fontStyle: FontStyle.normal,
                    color: Colors.black),
              ),
            ),
            Positioned(
                right: 10.0,
                child: mode == "icon"
                    ? SvgPicture.asset(
                        icon,
                        fit: BoxFit.fitHeight,
                      )
                    : Text(
                        icon,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      )),
          ],
        ),
      ),
      onPressed: press,
    );
  }
}
