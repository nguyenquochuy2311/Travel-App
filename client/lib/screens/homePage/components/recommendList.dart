import 'package:client/config/theme.dart';
import 'package:client/screens/detailPage/DetailPage.dart';
import 'package:flutter/material.dart';

final List<String> imgListRecommend = [
  'public/images/abria.png',
  'public/images/hollywood.png',
  'public/images/Turkey.png',
];

class RecommendList extends StatelessWidget {
  const RecommendList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const Text(
                  "Recommended List",
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
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: RecommendSlice()),
        ],
      ),
    );
  }
}

class RecommendSlice extends StatelessWidget {
  const RecommendSlice({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RecommendListImage(context);
  }
}

Widget RecommendListImage(context) => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imgListRecommend
            .map((e) => GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: Offset(4, 6))
                          ]),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                e.toString(),
                                fit: BoxFit.cover,
                                width: 155.0,
                                height: 188.0,
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  margin: const EdgeInsets.all(0.0),
                                  color: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 11.0, horizontal: 18.0),
                                  child: const Text(
                                    'Japan',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: kFontFamily),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  name: "weweqweq",
                                  location: "Dubai - Uni Emirat Arab",
                                  price: 213,
                                  time: "Per Night",
                                  url: e,
                                ))),
                  },
                ))
            .toList(),
      ),
    );
