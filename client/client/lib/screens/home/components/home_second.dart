import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/screens/login/login.dart';

final List<String> imgList = [
  'public/images/plan_1.jpeg',
  'public/images/plan_2.jpeg',
  'public/images/plan_3.jpeg',
];

class HomeSecond extends StatefulWidget {
  const HomeSecond({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<HomeSecond> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 28),
            child: CarouselSlider(
              items: imagesSlide,
              carouselController: _controller,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 11.0,
                  height: 11.0,
                  margin: EdgeInsets.symmetric(vertical: 32.0, horizontal: 7.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.blueGrey
                              : kPrimaryColor)
                          .withOpacity(_current == entry.key ? 1 : 0.4)),
                ),
              );
            }).toList(),
          ),
          Container(
              child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: const Text(
                  'Plan your trip',
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  Container(
                    child: const Text(
                      'Custom and fast planning',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    child: const Text(
                      'with a low price',
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 32, 0, 18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(4, 4))
                        ]),
                    child: TextButton(
                      style: (ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kSecondColor),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size.fromWidth(340),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(vertical: 16)),
                          alignment: Alignment.center,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                        maxLines: 24,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(4, 4))
                        ]),
                    child: TextButton(
                      style: (ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size.fromWidth(340),
                          ),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(vertical: 16)),
                          alignment: Alignment.center,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeSecond()),
                        );
                      },
                      child: const Text(
                        'Create accout',
                        style: TextStyle(
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                        maxLines: 24,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ))
        ]));
  }
}

final List<Widget> imagesSlide = imgList
    .map((e) => Container(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(e),
            )),
          ),
        ))
    .toList();
