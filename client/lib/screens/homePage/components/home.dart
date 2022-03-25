import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              child: CarouselSlider(
                items: imagesSlide,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 11.0,
                      height: 11.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.blueGrey
                                  : kPrimaryColor)
                              .withOpacity(_current == entry.key ? 1 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        )
      ])),
    );
  }
}

final List<Widget> imagesSlide = imgList
    .map((e) => Container(
          child: Container(
            child: Image.network(
              e,
              fit: BoxFit.cover,
              width: 814,
              height: 1034,
            ),
          ),
        ))
    .toList();
