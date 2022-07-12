import 'dart:ui';

import 'package:client/components/Header/headerDetailPage.dart';
import 'package:client/components/header.dart';
import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    key,
    required this.name,
    required this.location,
    required this.time,
    required this.price,
    required this.url,
  }) : super(key: key);
  final String name, location, time;
  final String url;
  final int price;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: 514,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
          ),
          child: Stack(
            children: <Widget>[
              HeaderDetailPage(country: "", type: ""),
              Positioned(
                bottom: 100.0,
                left: 20.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 354.0,
                      height: 250.0,
                      padding: const EdgeInsets.all(20.0),
                      color: const Color.fromARGB(40, 0, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 200.0,
                            child: Text(
                              name,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: kFontFamily),
                            ),
                          ),
                          Positioned(
                            top: 40.0,
                            right: 0.0,
                            child: Text(
                              '${price}VND',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: kFontFamily),
                            ),
                          ),
                          Positioned(
                              top: 100.0,
                              child: Text(
                                location,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: kFontFamily),
                              )),
                          Positioned(
                            right: 0.0,
                            bottom: 100.0,
                            child: Text(
                              time,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: kFontFamily),
                            ),
                          ),
                          Positioned(
                            bottom: 5.0,
                            left: 10.0,
                            child: Container(
                              width: 306.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 4,
                                      offset: const Offset(0, 4))
                                ],
                              ),
                              height: 50,
                              child: TextButton(
                                onPressed: () => {},
                                child: const Text(
                                  'Reserve Room',
                                  style: TextStyle(
                                      fontFamily: kFontFamily,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            kSecondColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 800,
          color: Colors.white,
        )
      ],
    ));
  }
}
