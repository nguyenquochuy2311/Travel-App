import 'package:client/config/theme.dart';
import 'package:flutter/material.dart';

class BackToScreen extends StatelessWidget {
  const BackToScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PreferredSize(
      preferredSize: const Size.fromHeight(80), // Set this height
      child: Container(
        color: Colors.grey[100],
        child: TextButton(
          child: const Icon(
            Icons.arrow_back_rounded,
            size: 40,
            color: Colors.black,
          ),
          onPressed: () => {Navigator.pop(context)},
        ),
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}
