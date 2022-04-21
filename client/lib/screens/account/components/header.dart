import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';

class HeaderAccount extends StatelessWidget {
  const HeaderAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 86.0, horizontal: 30.0),
          child: Column(
            children: [
              const Text(
                "John Huynh",
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
              TextButton(
                  onPressed: () => {},
                  child: const Text(
                    'View and edit your profile',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: -0.3,
                        color: Colors.black),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
