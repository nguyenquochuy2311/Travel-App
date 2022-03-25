import 'package:client/components/rounded_button.dart';
import 'package:client/config/theme.dart';
import 'package:client/screens/loginAndRegistor/components/login/login.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'public/images/plan_1.jpeg',
  'public/images/plan_2.jpeg',
  'public/images/plan_3.jpeg',
];

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<Welcome> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              SizedBox(height: size.height * 0.03),
              RoundedButton(
                text: "Log in",
                color: kSecondColor,
                textColor: Colors.white,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
              // RoundedButton(
              //   text: "Create Accout",
              //   color: Colors.white,
              //   press: (){
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => Register(),
              //     ))
              //   },
              // )
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
