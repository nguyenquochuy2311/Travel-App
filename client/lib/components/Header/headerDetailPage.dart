import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderDetailPage extends StatelessWidget {
  const HeaderDetailPage({key, required this.country, required this.type})
      : super(key: key);
  final String country;
  final String type;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: SvgPicture.asset(
            "public/images/Arrow_left_long.svg",
            color: Colors.white,
            width: 24.0,
            height: 24.0,
          ),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            iconSize: 40.0,
            icon: Container(
              width: 50.0,
              height: 50.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0)),
              child: SvgPicture.asset(
                "public/images/like.svg",
                color: kSecondColor,
                width: 12.0,
                height: 12.0,
              ),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
