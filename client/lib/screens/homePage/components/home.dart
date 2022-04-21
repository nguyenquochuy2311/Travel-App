import 'package:client/config/theme.dart';
import 'package:client/screens/homePage/components/bestDeal.dart';
import 'package:client/screens/homePage/components/popularDestination.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/screens/homePage/components/recommendList.dart';

final List<String> imgList = [
  'public/images/CF_town.png',
  'public/images/amrian.png',
  'public/images/Union.png'
];

class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<HomePageMain> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        Stack(
          children: [
            Container(
              // height: 533,
              width: 414,
              child: CarouselSlider(
                items: imagesSlide,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    height: 533,
                    aspectRatio: 16 / 9,
                    reverse: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 11.0,
                      height: 11.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 7.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.grey
                                  : kPrimaryColor)
                              .withOpacity(_current == entry.key ? 1 : 0.6)),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
                bottom: 30,
                left: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4))
                    ],
                  ),
                  height: 40,
                  width: 167,
                  // color: kPrimaryColor,
                  child: TextButton(
                    child: const Text("View detail",
                        style: TextStyle(
                            fontFamily: kFontFamily,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700)),
                    onPressed: () => {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kSecondColor),
                        fixedSize: MaterialStateProperty.all<Size>(
                          const Size.fromWidth(454),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        )),
                  ),
                )),
          ],
        ),
        SizedBox.fromSize(size: const Size(37.0, 37.0)),
        PopularList(),
        RecommendList(),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              child: const Text(
                "Best Deals",
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: 19.0,
                ),
                textAlign: TextAlign.start,
              )),
        ),
        BestDealList()
      ])),
    );
  }
}

final List<Widget> imagesSlide = imgList
    .map((e) => Container(
          child: Container(
            margin: EdgeInsets.all(0.0),
            child: Image.asset(
              e,
              fit: BoxFit.cover,
            ),
          ),
        ))
    .toList();
