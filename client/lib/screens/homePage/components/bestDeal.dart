import 'package:client/config/theme.dart';
import 'package:client/screens/detailPage/DetailPage.dart';
import 'package:flutter/material.dart';

final List<String> imgPopular = [
  'public/images/Japan.png',
  'public/images/Indian.png',
  'public/images/France.png'
];

class BestDealContainer extends StatelessWidget {
  const BestDealContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24.0),
                child: const Text(
                  "Best Deal",
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w700,
                    fontSize: 19.0,
                  ),
                  textAlign: TextAlign.start,
                )),
          ),
          Container(
            child: BestDeal(),
          )
        ],
      ),
    );
  }
}

class BestDeal extends StatelessWidget {
  BestDeal({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      width: 354.0,
      child: Column(
        children: imgPopular
            .map(
              (e) => GestureDetector(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: Offset(4, 6))
                      ]),
                  child: Container(
                    width: 375.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              e.toString(),
                              fit: BoxFit.cover,
                              width: 125.0,
                              height: 134.0,
                            ),
                            Positioned(
                              top: 0.0,
                              left: 125.0,
                              child: Container(
                                margin: const EdgeInsets.all(0.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 11.0, horizontal: 18.0),
                                child: const Text(
                                  'Japan',
                                  style: TextStyle(
                                      color: Colors.black,
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
                        builder: (context) => DetailPage(
                              name: "Tran Nguyen Chien",
                              location: "Dubai - Uni Emirat Arab",
                              price: 213,
                              time: "Per Night",
                              url: e,
                            ))),
              ),
            )
            .toList(),
      ),
    );
  }
}
