import 'package:client/components/Accout/ButtonProfile.dart';
import 'package:client/components/backToScreen.dart';
import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({
    key,
    required this.image,
  }) : super(key: key);
  final String image;
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
                  "Edit Profile",
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 6)),
                      ]),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          image,
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 5.0,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: kSecondColor,
                                borderRadius: BorderRadius.circular(100.0)),
                            child: SvgPicture.asset(
                              "public/images/photo-camera.svg",
                              width: 20.0,
                              height: 20.0,
                              fit: BoxFit.fitHeight,
                            ),
                          ))
                    ],
                  )),
              ButtonProfile(
                  icon: "Nguyen Chien",
                  name: "Username",
                  press: () => {},
                  mode: "text"),
              ButtonProfile(
                  icon: "nguyenchien@gmail.com",
                  name: "Email",
                  press: () => {},
                  mode: "text"),
              ButtonProfile(
                  icon: "0123456789",
                  name: "Phone",
                  press: () => {},
                  mode: "text"),
              ButtonProfile(
                  icon: "01-02-2000",
                  name: "Day of Birth",
                  press: () => {},
                  mode: "text"),
              ButtonProfile(
                  icon: "TP. Ho Chi Minh, VietNam",
                  name: "Address",
                  press: () => {},
                  mode: "text"),
            ],
          )),
        ));
  }
}
