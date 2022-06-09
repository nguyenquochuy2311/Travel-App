import 'package:client/config/theme.dart';
import 'package:client/screens/home/components/home_second.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({key, required this.picture}) : super(key: key);
  final String picture;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: 514,
          height: 788,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("public/images/detailImage.png"),
            fit: BoxFit.cover,
          )),
          child: Stack(
            children: [Container(height: 800)],
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
