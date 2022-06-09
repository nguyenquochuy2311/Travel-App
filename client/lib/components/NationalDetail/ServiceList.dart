import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceList extends StatelessWidget {
  const ServiceList(
      {key,
      required this.name,
      required this.picture,
      required this.location,
      required this.price,
      required this.time})
      : super(key: key);
  final String name;
  final String location;
  final int price;
  final String time;
  final String picture;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
      alignment: Alignment.center,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(4, 6))
        ]),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            child: Stack(
              children: [
                Image.asset(
                  picture.toString(),
                  fit: BoxFit.cover,
                  width: 345.0,
                  height: 210.0,
                ),
                Positioned(
                    top: 15.0,
                    right: 15.0,
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(4, 6))
                          ]),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          "public/images/like.svg",
                          color: kSecondColor,
                        ),
                        onTap: () => {},
                      ),
                    )),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      margin: const EdgeInsets.all(0.0),
                      height: 75.0,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 11.0, horizontal: 18.0),
                      child: Stack(
                        children: <Widget>[
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                                fontFamily: kFontFamily),
                          ),
                          Positioned(
                            right: 0.0,
                            child: Text(
                              '${price}VND',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: kFontFamily),
                            ),
                          ),
                          Positioned(
                              bottom: 0.0,
                              child: Text(
                                location,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: kFontFamily),
                              )),
                          Positioned(
                            right: 0.0,
                            bottom: 0.0,
                            child: Text(
                              time,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: kFontFamily),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
