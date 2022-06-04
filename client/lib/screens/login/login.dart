import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:client/config/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client/screens/homePage/home_page.dart';
import 'package:client/components/backToScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Login> {
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80), // Set this height
          child: Container(
            color: Colors.grey[100],
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                width: 414.0,
                height: 896.0,
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                color: Colors.grey[100],
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 32),
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
                                width: 165,
                                height: 50,
                                child: TextButton(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 0,
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 23),
                                              width: 30,
                                              height: 30,
                                              child: Image.asset(
                                                "public/icons/google.png",
                                                fit: BoxFit.fitHeight,
                                              ))),
                                      const Text(
                                        'Google',
                                        style: TextStyle(
                                            fontSize: 16,
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
                                width: 167,
                                height: 50,
                                margin: const EdgeInsets.only(left: 20),
                                child: TextButton(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 0,
                                          child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              width: 30,
                                              height: 30,
                                              child: SvgPicture.asset(
                                                "public/icons/facebook.svg",
                                                fit: BoxFit.fitHeight,
                                              ))),
                                      const Text(
                                        'Facebook',
                                        style: TextStyle(
                                            fontSize: 15,
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
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 32),
                      child: TextButton(
                        child: const Text(
                          'Forgot your password ?',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4))
                        ],
                      ),
                      width: 454,
                      height: 50,
                      child: TextButton(
                        onPressed: _validate,
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              fontFamily: kFontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kSecondColor),
                            fixedSize: MaterialStateProperty.all<Size>(
                              const Size.fromWidth(454),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            )),
                      ),
                    ),
                    Container(
                      width: 230,
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        children: <Widget>[
                          const Expanded(
                              flex: 1,
                              child: Text(
                                'Don’t have an account yet?',
                                style: TextStyle(fontSize: 12),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Sign up',
                                style: TextStyle(fontSize: 12),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ));
  }
}

extension CustomValidationBuilder on ValidationBuilder {
  password() => add((value) {
        if (value == 'password') {
          return 'Password should not "password"';
        }
        return null;
      });
}

Widget formValidationInput(values, message, boolean) => Material(
      elevation: 0.0,
      shadowColor: Colors.black.withOpacity(1),
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
          suffix: values == 'Password' ? eyeContainer() : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 1,
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

Widget eyeContainer() => TextButton(
      child: const Icon(Icons.remove_red_eye),
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.only(top: 0)),
        foregroundColor: MaterialStateProperty.all<Color>(kSecondColor),
      ),
      onHover: null,
      onFocusChange: null,
    );
