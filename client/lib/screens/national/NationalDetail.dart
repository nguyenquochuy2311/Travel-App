import 'package:client/components/NationalDetail/ServiceList.dart';
import 'package:client/components/header.dart';
import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NationalDetail extends StatelessWidget {
  const NationalDetail({key, required this.country}) : super(key: key);
  final String country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90), // Set this height
        child: Header(
          country: country,
          type: 'NationalDetail',
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.grey[300],
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(30.0, 30.0, 90.0, 30.0),
                      child: Material(
                        elevation: 10.0,
                        shadowColor: Colors.black.withOpacity(1),
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(30)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(32, 16, 32, 16),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 30.0,
                        right: 20.0,
                        child: GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                color: kSecondColor,
                                borderRadius: BorderRadius.circular(100.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: Offset(4, 6))
                                ]),
                            width: 56.0,
                            height: 56.0,
                            padding: EdgeInsets.all(13.0),
                            child: SvgPicture.asset("public/images/search.svg"),
                          ),
                          onTap: () => {},
                        ))
                  ],
                )),
            ServiceList(
              name: "Burj Al Arab",
              location: "Dubai - Uni Emirat Arab",
              price: 9999999,
              picture: "public/images/Indian.png",
              time: "Per Night",
            ),
          ],
        ),
      ),
    );
  }
}
