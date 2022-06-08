import 'package:client/config/theme.dart';
import 'package:client/screens/account/components/EditProfilePage.dart';
import 'package:flutter/material.dart';

class HeaderAccount extends StatelessWidget {
  const HeaderAccount({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
          child: Column(
            children: [
              Container(
                width: 200.0,
                alignment: Alignment.topLeft,
                child: const Text(
                  "Nguyen Chien",
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage(
                                image: "public/images/avatar.png")),
                      ),
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
        ),
        Container(
            child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.asset(
            'public/images/avatar.png',
            width: 115,
            height: 115,
          ),
        ))
      ],
    );
  }
}
