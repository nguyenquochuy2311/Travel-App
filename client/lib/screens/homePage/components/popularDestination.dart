import 'package:client/config/theme.dart';
import 'package:client/screens/national/NationalDetail.dart';
import 'package:flutter/material.dart';

const List<String> imgPopular = [
  'public/images/Japan.png',
  'public/images/Indian.png',
  'public/images/France.png'
];

class PopularList extends StatelessWidget {
  const PopularList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 26.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const Text(
                  "Popular Destination",
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.start,
                )),
          ),
          Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 28.0, horizontal: 16.0),
              child: const PopularSlice()),
        ],
      ),
    );
  }
}

class PopularSlice extends StatelessWidget {
  const PopularSlice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imgPopular
            .map((e) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 8.0),
                    child: Container(
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                e.toString(),
                                fit: BoxFit.cover,
                                width: 291.0,
                                height: 188.0,
                              ),
                              Positioned(
                                top: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  margin: const EdgeInsets.all(0.0),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 11.0, horizontal: 18.0),
                                  child: const Text(
                                    'Japan',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: kFontFamily),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NationalDetail(country: "Japan"))),
                ))
            .toList(),
      ),
    );
  }
}
