import 'package:client/components/Accout/ButtonProfile.dart';
import 'package:client/config/theme.dart';
import 'package:client/screens/account/components/change_password.dart';
import 'package:client/screens/account/components/header.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderAccount(),
            Column(
              children: [
                ButtonProfile(
                  icon: "public/images/lock.svg",
                  name: "Change password",
                  press: () => {},
                ),
                ButtonProfile(
                  icon: "public/images/call-center.svg",
                  name: "Travel agent",
                  press: () => {},
                ),
                ButtonProfile(
                  icon: "public/images/movie-tickets.svg",
                  name: "Ticket history",
                  press: () => {},
                ),
                ButtonProfile(
                  icon: "public/images/credit-card.svg",
                  name: "Payment",
                  press: () => {},
                ),
                ButtonProfile(
                  icon: "public/images/help.svg",
                  name: "Help Center",
                  press: () => {},
                ),
                ButtonProfile(
                  icon: "public/images/gear.svg",
                  name: "Setting",
                  press: () => {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
