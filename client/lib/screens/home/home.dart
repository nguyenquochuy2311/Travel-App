import 'package:client/screens/home/components/home_first.dart';
import 'package:client/screens/home/components/home_second.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: HomeFirst(),
    );
  }
}
