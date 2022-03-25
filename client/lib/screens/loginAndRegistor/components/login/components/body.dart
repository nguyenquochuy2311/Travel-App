import 'dart:html';
import 'dart:ui';

import 'package:client/components/check_accout.dart';
import 'package:client/components/rounded_button.dart';
import 'package:client/screens/loginAndRegistor/components/registor/register.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:client/config/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client/screens/homePage/home_page.dart';

class Body extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  void _validate() {
    _formKey.currentState!.validate();
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      color: Colors.grey[100],
      child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                ),
                              )),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 32.0),
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: kFontFamily,
                              ),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: const Offset(0, 4))
                                    ]),
                                width: size.width / 2.5,
                                height: heightLarge,
                                child: TextButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              right: marginMD),
                                          child: Image.network(
                                            "public/icons/google.png",
                                            width: 30,
                                            fit: BoxFit.fitHeight,
                                          )),
                                      const Text(
                                        'Google',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: kFontFamily,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        const EdgeInsets.fromLTRB(16, 9, 0, 9)),
                                    alignment: Alignment.center,
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: const Offset(0, 4))
                                    ]),
                                width: size.width / 2.5,
                                height: heightLarge,
                                margin: const EdgeInsets.only(left: 20),
                                child: TextButton(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: const EdgeInsets.only(
                                              right: marginSM),
                                          child: SvgPicture.network(
                                            "public/icons/facebook.svg",
                                            width: 15,
                                            fit: BoxFit.fitHeight,
                                          )),
                                      const Text(
                                        'Facebook',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: kFontFamily,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    fixedSize: MaterialStateProperty.all<Size>(
                                      const Size.fromWidth(167),
                                    ),
                                    padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                        const EdgeInsets.fromLTRB(16, 9, 0, 9)),
                                    alignment: Alignment.center,
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 36),
                            child: const Text(
                              'Or log in using',
                              style: TextStyle(
                                  fontFamily: kFontFamily,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        formValidationInput(
                            'Your Email', 'Please input your Email', false),
                        const SizedBox(height: 30),
                        formValidationInput(
                            'Password', 'Please input your Password', true)
                      ],
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: GestureDetector(
                        child: const Text(
                          'Forgot your password ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                    ),
                    RoundedButton(
                      text: 'Log in',
                      press: _validate,
                      color: kSecondColor,
                    ),
                    Container(
                        height: size.height * 0.05,
                        child: AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Register();
                                },
                              ),
                            );
                          },
                        ))
                  ],
                ),
              ))),
    );
  }
}

Widget formValidationInput(values, message, boolean) => Material(
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.01),
      borderRadius: BorderRadius.circular(30),
      color: Colors.transparent,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return message;
          }
        },
        decoration: InputDecoration(
          hintText: values,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(30),
          ),
          suffixIcon: values == 'Password' ? eyeContainer() : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hoverColor: Colors.white,
          contentPadding: const EdgeInsets.fromLTRB(36, 4, 36, 4),
        ),
        obscureText: boolean,
        style: const TextStyle(
          fontFamily: kFontFamily,
        ),
      ),
    );

Widget eyeContainer() => Container(
      padding: const EdgeInsets.only(right: paddingMD),
      child: const Icon(
        Icons.remove_red_eye,
        color: kSecondColor,
      ),
    );
