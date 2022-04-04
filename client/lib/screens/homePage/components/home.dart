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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.8,
              child: CarouselSlider(
                items: imgList
                    .map(
                      (e) => Image.asset(
                        e,
                        fit: BoxFit.fill,
                        width: double.infinity,
                        // height: size.height * 0.1,
                        // scale: size.height,
                      ),
                    )
                    .toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Positioned(
              bottom: 21,
              right: 21,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 11.0,
                      height: 11.0,
                      margin: const EdgeInsets.only(right: marginXS),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.blueGrey
                                : kPrimaryColor)
                            .withOpacity(_current == entry.key ? 1 : 0.7),
                      ),
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
